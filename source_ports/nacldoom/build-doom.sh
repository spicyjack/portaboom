#!/bin/bash

set -o errexit
set -o nounset

tc=$1
source setup-tools.sh

rm -f plugin.o
${NACL_CC} \
  -O2 \
  -c plugin.cc -I"${DEST_ROOT}/sdl-nacl-install/include/SDL" \
  -I"${DEST_ROOT}/bzip2-nacl-install/include" \
  -D_GNU_SOURCE=1 -D_REENTRANT \
  -o plugin.o

rm -f doom1_wad_bz2.o
${NACL_CC} -O2 -c doom1_wad_bz2.c -o doom1_wad_bz2.o

rm -f file_wrapper.o
${NACL_CC} -O2 -c file_wrapper.c -o file_wrapper.o

rm -rf doom-build
mkdir doom-build
cd doom-build

if [[ ${tc} =~ sdk ]] ; then
  export EXTRA_LIBS="../plugin.o ../file_wrapper.o ../doom1_wad_bz2.o \
-L../bzip2-nacl-install/lib -lbz2 -L../sdl-nacl-install/lib -lSDL \
-lppruntime -lppapi_cpp -lplatform -lgio -lpthread -lm -lpthread -lsrpc -lstdc++ -lnosys"
else
  export EXTRA_LIBS="../plugin.o ../file_wrapper.o ../doom1_wad_bz2.o \
-L../bzip2-nacl-install/lib -lbz2 -L../sdl-nacl-install/lib -lSDL \
-lppruntime -lppapi_cpp -lplatform -lgio -lpthread -lm -lpthread -lsrpc -limc -limc_syscalls -lstdc++ -lnosys"
fi

env -i
  CC="${NACL_CC}" \
  CXX="${NACL_CXX}" \
  LD="${NACL_CXX}" \
  CFLAGS="-fwrapv -fsigned-char" \
  ../sdldoom-1.10/configure --prefix="${DEST_ROOT}/doom-install" \
    --host=linux --with-sdl-prefix="${DEST_ROOT}/sdl-nacl-install" \
    --disable-sdltest

make -j6

${NACL_STRIP} -s ./doom

if [ ${tc} == "pnacl" ] ; then
  cp doom ../doom.pexe
  cd ..
  ${NACL_ROOT}/bin/pnacl-translate -arch x86-32 doom.pexe -o doom32.nexe &
  ${NACL_ROOT}/bin/pnacl-translate -arch x86-64 doom.pexe -o doom64.nexe &
  wait
fi
