#ifndef _SDL_nacl_eventqueue_h
#define _SDL_nacl_eventqueue_h

#include "SDL_mutex.h"

#include <queue>
#include <ppapi/c/pp_input_event.h>
#include <pthread.h>

class EventQueue {
public:
  EventQueue() {
    pthread_mutex_init(&mu_, NULL);
  }

  ~EventQueue() {
  }

  PP_InputEvent* PopEvent() {
    pthread_mutex_lock(&mu_);
    PP_InputEvent* event = NULL;
    if (!queue_.empty()) {
      event = queue_.front();
      queue_.pop();
    }
    pthread_mutex_unlock(&mu_);
    return event;
  }

  void PushEvent(PP_InputEvent* event) {
    pthread_mutex_lock(&mu_);
    queue_.push(event);
    pthread_mutex_unlock(&mu_);
  }

private:
  std::queue<PP_InputEvent*> queue_;
  pthread_mutex_t mu_;
};

#endif // _SDL_nacl_eventqueue_h
