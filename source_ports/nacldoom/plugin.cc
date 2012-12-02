// Copyright (c) 2011 The Native Client Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <bzlib.h>

#include <ppapi/cpp/instance.h>
#include <ppapi/cpp/module.h>
#include <ppapi/cpp/dev/scriptable_object_deprecated.h>
#include <ppapi/cpp/var.h>
#include <ppapi/cpp/rect.h>
#include <ppapi/cpp/size.h>
#include <nacl/nacl_log.h>

#include <SDL_video.h>
#include <list>
#include <string>

#include <SDL.h>
#include <SDL_nacl.h>

static std::string console_text;
static pthread_mutex_t console_text_mutex = PTHREAD_MUTEX_INITIALIZER;

static pthread_cond_t console_cond = PTHREAD_COND_INITIALIZER;
static pthread_mutex_t console_cond_mutex = PTHREAD_MUTEX_INITIALIZER;


static volatile int console_counter = 0;
static pthread_t main_thread;

static char multiply_arg[8];

extern "C" {

unsigned int doom1_wad_size = 4196020;
char *doom1_wad = NULL;

extern const unsigned doom1_wad_bz2_size;
extern const char *doom1_wad_bz2;

extern int sdl_main(int argc, const char *argv[]);
}

void SetExceptionString(pp::Var* exception, const std::string& except_string) {
  if (exception) {
    *exception = except_string;
  }
}

class MyScriptableObject : public pp::deprecated::ScriptableObject {
 public:
    virtual bool HasMethod(const pp::Var& method, pp::Var* exception);
    virtual pp::Var Call(const pp::Var& method,
                       const std::vector<pp::Var>& args,
                       pp::Var* exception);
};

bool MyScriptableObject::HasMethod(const pp::Var& method, pp::Var* exception) {
  if (!method.is_string()) {
    SetExceptionString(exception, "Method not a string");
    return false;
  }
  std::string method_name = method.AsString();
  return method_name == "getconsole";
}

static pp::Var GetConsole() {
  pthread_cond_broadcast(&console_cond);
  console_counter++;
  return pp::Var(console_text);
}


pp::Var MyScriptableObject::Call(const pp::Var& method,
                                 const std::vector<pp::Var>& args,
                                 pp::Var* exception) {
  if (!method.is_string()) {
    SetExceptionString(exception, "Method not a string");
    return pp::Var();
  }
  std::string method_name = method.AsString();
  if (method_name == "getconsole") {
    return GetConsole();
  } else {
    SetExceptionString(exception,
                       std::string("No method: ") + method_name);
  }
  return pp::Var();
}

class PluginInstance : public pp::Instance {
 public:
  explicit PluginInstance(PP_Instance instance) : pp::Instance(instance),
						  sdl_main_thread_(0),
						  width_(0),
						  height_(0),
                                                  GotDidChangeView_(false),
                                                  GotInit_(false) {}
  ~PluginInstance() {
    if (sdl_main_thread_) {
      pthread_join(sdl_main_thread_, NULL);
    }
  }

  virtual pp::Var GetInstanceObject() {
    MyScriptableObject* obj = new MyScriptableObject();
    return pp::Var(this, obj);
  }

  virtual void DidChangeView(const pp::Rect& position, const pp::Rect& clip) {
    if (position.size().width() == width_ &&
	position.size().height() == height_)
      return;  // Size didn't change, no need to update anything.

    printf("DidChangeView: new %dx%d, old %dx%d\n",
	   position.size().width(), position.size().height(),
	   width_, height_);
    width_ = position.size().width();
    height_ = position.size().height();
    GotDidChangeView_ = true;
    StartMainThread();
  }

  bool HandleInputEvent(const PP_InputEvent& event) {
    SDL_NACL_PushEvent(&event);
    return true;
  }

  void DecompressWAD() {
    int i;
    doom1_wad = (char*)malloc(doom1_wad_size);
    if (!doom1_wad) {
      printf("Out of memory!!");
      exit(1);
    }

    i = BZ2_bzBuffToBuffDecompress(doom1_wad, &doom1_wad_size,
                                   (char*)doom1_wad_bz2, doom1_wad_bz2_size,
                                   0, 0);
    if (i != BZ_OK) {
      printf("BZ2 failed: %d\n", i);
      exit(1);
    }
  }

  void StartMainThread() {
    if (sdl_thread_started_ == false && GotInit_ && GotDidChangeView_) {

      DecompressWAD();
      printf("SDL_NACL_SetInstance(..., %d, %d)\n", width_, height_);
      SDL_NACL_SetInstance(pp_instance(), width_, height_);
      // It seems this call to SDL_Init is required. Calling from
      // sdl_main() isn't good enough.
      // Perhaps it must be called from the main thread?
      int lval = SDL_Init(SDL_INIT_VIDEO|SDL_INIT_AUDIO);
      printf("SDL_init called\n");
      if (lval < 0)
        printf("SDL_init failed: %d!\n", lval);
      else
        printf("SDL_init succeeded!\n");
      if (0 == pthread_create(&sdl_main_thread_, NULL, sdl_thread, this)) {
	sdl_thread_started_ = true;
        printf("Started sdl_thread\n");
      }
    }
  }

  virtual bool Init(uint32_t argc, const char* argn[], const char* argv[]) {
    sprintf(multiply_arg, "-1");
    for (int i=0; i < argc; i++) {
      std::string tag = argn[i];
      if (tag == "scale_factor") {
        int v = atoi(argv[i]);
        if (v >= 1 && v <= 4) {
          sprintf(multiply_arg, "-%d", v);
        }
      }
    }

    GotInit_ = true;
    StartMainThread();
    return true;
  }

 private:
  bool sdl_thread_started_;
  pthread_t sdl_main_thread_;
  int width_;
  int height_;
  bool GotDidChangeView_;
  bool GotInit_;
  bool multiply_;

  static void* sdl_thread(void* param) {
    const char *p[2] = { "doom.exe", multiply_arg };
    sdl_main(2, p);
    return NULL;
  }
};

class PepperModule : public pp::Module {
 public:
  // Create and return a PluginInstanceInstance object.
  virtual pp::Instance* CreateInstance(PP_Instance instance) {
    return new PluginInstance(instance);
  }
};

namespace pp {
  Module* CreateModule() {
    printf("CreateModule called\n");
    main_thread = pthread_self();
    return new PepperModule();
  }
}  // namespace pp
