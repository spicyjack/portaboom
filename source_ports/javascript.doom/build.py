#!/usr/bin/python

CONFIG = 0
DEBUG = 1
AUTODEBUG = 0
DFE = 0
NATIVE = 0
SCRIPT = 1
EMBED_WAD = 0
LLVM_OPT_OPTS = ['-deadargelim', '-licm', '-adce', '-deadtypeelim', '-globaldce', '-constmerge'] #['-globalopt', '-ipsccp', '-deadargelim', '-simplifycfg', '-prune-eh', '-inline', '-functionattrs', '-argpromotion', '-simplify-libcalls', '-jump-threading', '-simplifycfg', '-tailcallelim', '-simplifycfg', '-reassociate', '-loop-rotate', '-licm', '-loop-unswitch', '-indvars', '-loop-deletion', '-loop-unroll', '-memcpyopt', '-sccp', '-jump-threading', '-correlated-propagation', '-dse', '-adce', '-simplifycfg', '-strip-dead-prototypes', '-deadtypeelim', '-globaldce', '-constmerge']

import os, sys
from subprocess import Popen, PIPE, STDOUT

exec(open(os.path.expanduser('~/.emscripten'), 'r').read())

try:
  EMSCRIPTEN_ROOT
except:
  print "ERROR: Missing EMSCRIPTEN_ROOT (which should be equal to emscripten's root dir) in ~/.emscripten"
  sys.exit(1)

exec(open(os.path.join(EMSCRIPTEN_ROOT, 'tools', 'shared.py'), 'r').read())

stage_counter = 0
def stage(text):
  global stage_counter
  stage_counter += 1
  text = 'Stage %d: %s' % (stage_counter, text)
  print
  print '=' * len(text)
  print text
  print '=' * len(text)
  print

stage('C++ => LLVM binary')

env = os.environ.copy()
env['EMMAKEN_COMPILER'] = CLANG
if DEBUG:
  env['CFLAGS'] = '-g'
env['CC'] = env['CXX'] = env['RANLIB'] = env['AR'] = os.path.join(EMSCRIPTEN_ROOT, 'tools', 'emmaken.py')
if CONFIG:
  Popen(['./configure'], env=env).communicate()
Popen(['make', '-j', '4'], env=env).communicate()

assert os.path.exists('doom'), 'Failed to create client'

if LLVM_OPT_OPTS:
  stage('LLVM optimizations')

  shutil.move('doom', 'doom.pre')
  output = Popen([LLVM_OPT, 'doom.pre'] + LLVM_OPT_OPTS + ['-o=doom'], stdout=PIPE, stderr=STDOUT).communicate()

stage('LLVM binary => LL assembly')

Popen([LLVM_DIS] + LLVM_DIS_OPTS + ['doom', '-o=client.ll']).communicate()

assert os.path.exists('client.ll'), 'Failed to create client assembly code'

if DFE:
  stage('Dead function elimination')

  Popen([os.path.join(EMSCRIPTEN_ROOT, 'tools', 'dead_function_eliminator.py'), 'client.ll', 'client.dfe.ll']).communicate()
else:
  shutil.move('client.ll', 'client.dfe.ll')

if AUTODEBUG:
  stage('Autodebugger')

  AUTODEBUGGER = os.path.join(EMSCRIPTEN_ROOT, 'tools', 'autodebugger.py')
  Popen(['python', AUTODEBUGGER, 'client.dfe.ll', 'client.ad.ll'], stdout=PIPE, stderr=STDOUT).communicate()[0]
  f = open('client.ad.ll', 'a+')
  f.write('!99999 = metadata !{i32 465, i32 5, metadata !35036, null}\n') # Ensure we pick up on debug stuff
  f.close()
else:
  shutil.move('client.dfe.ll', 'client.ad.ll')

if NATIVE:
  stage('Generate .bc file')

  Popen([LLVM_AS] + ['client.ad.ll', '-o=doom.bc']).communicate()

if SCRIPT:
  stage('Emscripten: LL assembly => JS')

  SAFE_OPT_LINES = ['r_draw.c:' + str(x) for x in [128,133,142,144,145,147,552,556,559,560,562]] + \
                   ['m_swap.c:53'] + \
                   ['v_video.c:' + str(x) for x in [254,256,257]]

  settings = {
    'EXPORTED_FUNCTIONS': ['_main', '_doOneIteration', '_SDL_Quit'], 
    'SKIP_STACK_IN_SMALL': 1, # use 0 for debugging, debugging output can be big
    'OPTIMIZE': 1,
    'RELOOP': 1,
    'USE_TYPED_ARRAYS': 1,
    'SAFE_HEAP': 0,
    'ASSERTIONS': 0,
    'INIT_STACK': 0,

    'AUTO_OPTIMIZE': 0,

    'CHECK_OVERFLOWS': 0,
    'CHECK_SIGNED_OVERFLOWS': 0,
    'CORRECT_OVERFLOWS': 3,
    'CORRECT_OVERFLOWS_LINES': SAFE_OPT_LINES,

    'CHECK_SIGNS': 0,
    'CORRECT_SIGNS': 3,
    'CORRECT_SIGNS_LINES': SAFE_OPT_LINES,

    ####'QUANTUM_SIZE': 1,
  }
  Popen(['python', os.path.join(EMSCRIPTEN_ROOT, 'emscripten.py'), 'client.ad.ll', str(settings).replace("'", '"')], stdout=open('client.js', 'w'), stderr=STDOUT).communicate()

  assert os.path.exists('client.js'), 'Failed to create client script code'

  if EMBED_WAD:
    stage('Embed wad file')

    #wad = eval(open('doom1.wad.js').read())
    #      #[1,2,3,4,5,6,7,8,9,1,2,3,4,5,56,6,7,8,3,2,234,23,34,34,2,1,2,34,46,34,234,3,3,35,2,46,23,324,34,4,26,4,2456,245,634,3456]#
    #wad_size = len(wad)
    #wad_generator = '''
    #  var doomWadArray = [];
    #'''
    #bucket = 1024*10;
    #curr = 0
    #while wad_size > 0:
    #  wad_generator += '''
    #    doomWadArray = doomWadArray.concat(%s);
    #  ''' % str(wad[curr*bucket:(curr+1)*bucket]).replace(' ', '')
    #  wad_size -= bucket
    #  curr += 1
    #wad_generator += '''
    #  this._STDIO.prepare('doom1.wad', doomWadArray);
    #  //print('qq : ' + doomWadArray);
    #  //print('zz : ' + _STDIO.streams[_STDIO.open('doom1.wad')].data);
    #'''

    wad = open('doom1.wad.js').read()
    wad_generator = '''this._STDIO.prepare('doom1.wad', %s);''' % wad

    additional = wad_generator + '''

      // mocks
      Module.ctx2D = {
        getImageData: function(x,y,w,h) {
          return {
            data: new Array(w*h*4),
          }
        },
        putImageData: function(){},
      };
      Module.canvas = {
        width: 320,
        height: 200,
      };
    '''

    code = open('client.js', 'r').read()
    final = open('doom.js', 'w')

    final.write(
      code.replace('// {{PRE_RUN_ADDITIONS}}', additional)
          .replace('addEventListener(event, SDL.receiveEvent);', '') # Fixes for console - if you embed, you must want that
    )
    final.close()
  else:
    shutil.move('client.js', 'doom.js')

if NATIVE:
  stage('Generate comparison native executable')

  Popen([os.path.join(LLVM_ROOT, 'llc'), 'doom.bc', '-o=doom.asm']).communicate()
  Popen(['as', 'doom.asm', '-o', 'doom.o']).communicate()
  Popen([CLANG, '-o', 'doom.exe', 'doom.o', '-lm', '-L/usr/lib', '-lSDL']).communicate()


# java -jar ~/Dev/closure-compiler-read-only/build/compiler.jar --compilation_level ADVANCED_OPTIMIZATIONS --formatting PRETTY_PRINT --variable_map_output_file doom.js.vars --js doom.js --js_output_file doom.cc.js

