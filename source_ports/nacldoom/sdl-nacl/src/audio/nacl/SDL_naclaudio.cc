
#include "SDL_config.h"
#include "SDL_naclaudio.h"

#include <assert.h>
#include <ppapi/cpp/instance.h>

extern pp::Instance* gNaclPPInstance;

extern "C" {

#include "SDL_rwops.h"
#include "SDL_timer.h"
#include "SDL_audio.h"
#include "../SDL_audiomem.h"
#include "../SDL_audio_c.h"
#include "../SDL_audiodev_c.h"

  /* The tag name used by NACL audio */
#define NACLAUD_DRIVER_NAME         "nacl"

#define SIZE_T   uint32_t

const uint32_t kSampleFrameCount = 4096u;

/* Audio driver functions */
static int NACLAUD_OpenAudio(_THIS, SDL_AudioSpec *spec);
static void NACLAUD_CloseAudio(_THIS);

static void AudioCallback(void* samples, SIZE_T buffer_size, void* data);


/* Audio driver bootstrap functions */
static int NACLAUD_Available(void) {
  return gNaclPPInstance != 0;
}

static void NACLAUD_DeleteDevice(SDL_AudioDevice *device) {
  // We should stop playback here, but it can only be done on the main thread :(
}

static SDL_AudioDevice *NACLAUD_CreateDevice(int devindex) {
  SDL_AudioDevice *_this;

  /* Initialize all variables that we clean on shutdown */
  _this = (SDL_AudioDevice *)SDL_malloc(sizeof(SDL_AudioDevice));
  if ( _this ) {
    SDL_memset(_this, 0, (sizeof *_this));
    _this->hidden = (struct SDL_PrivateAudioData *)
        SDL_malloc((sizeof *_this->hidden));
  }
  if ( (_this == NULL) || (_this->hidden == NULL) ) {
    SDL_OutOfMemory();
    if ( _this ) {
      SDL_free(_this);
    }
    return(0);
  }
  SDL_memset(_this->hidden, 0, (sizeof *_this->hidden));

  pthread_mutex_init(&_this->hidden->mutex, NULL);

  _this->hidden->opened = false;

  // TODO: Move audio device creation to NACLAUD_OpenAudio.
  //_this->hidden->sample_frame_count =
  //    pp::AudioConfig::RecommendSampleFrameCount(PP_AUDIOSAMPLERATE_44100, 0);

  //if (_this->hidden->sample_frame_count == 0)
  _this->hidden->sample_frame_count = 512u;

  printf("Initializing audio with sample_frame_count = %lld\n", (long long)_this->hidden->sample_frame_count);
  fflush(stdout);
  pp::AudioConfig config(gNaclPPInstance,
                      PP_AUDIOSAMPLERATE_44100,
                      _this->hidden->sample_frame_count);

  _this->hidden->audio = pp::Audio(
      gNaclPPInstance, config,
      AudioCallback, _this);

  fflush(stdout);
  // Start audio playback while we are still on the main thread.
  _this->hidden->audio.StartPlayback();

  /* Set the function pointers */
  _this->OpenAudio = NACLAUD_OpenAudio;
  _this->CloseAudio = NACLAUD_CloseAudio;

  _this->free = NACLAUD_DeleteDevice;

  return _this;
}

AudioBootStrap NACLAUD_bootstrap = {
  NACLAUD_DRIVER_NAME, "SDL nacl audio driver",
  NACLAUD_Available, NACLAUD_CreateDevice
};


static void NACLAUD_CloseAudio(_THIS) {
  pthread_mutex_lock(&_this->hidden->mutex);
  _this->hidden->opened = 0;
  pthread_mutex_unlock(&_this->hidden->mutex);
}


static void AudioCallback(void* samples, SIZE_T buffer_size, void* data) {
  SDL_AudioDevice* _this = reinterpret_cast<SDL_AudioDevice*>(data);

  pthread_mutex_lock(&_this->hidden->mutex);
  if (_this->hidden->opened) {
    SDL_memset(samples, _this->spec.silence, buffer_size);
    SDL_LockMutex(_this->mixer_lock);
    (*_this->spec.callback)(_this->spec.userdata,
        (Uint8*)samples, buffer_size);
    SDL_UnlockMutex(_this->mixer_lock);
  } else {
    SDL_memset(samples, 0, buffer_size);
  }
  pthread_mutex_unlock(&_this->hidden->mutex);

  return;
}


static int NACLAUD_OpenAudio(_THIS, SDL_AudioSpec *spec) {
  // We don't care what the user wants.
  spec->freq = 44100;
  spec->format = AUDIO_S16LSB;
  spec->channels = 2;
  spec->samples = _this->hidden->sample_frame_count;

  printf("spec->freq     = %lld\n", (long long)spec->freq);
  printf("spec->channels = %lld\n", (long long)spec->channels);
  printf("spec->samples  = %lld\n", (long long)spec->samples);

  pthread_mutex_lock(&_this->hidden->mutex);
  _this->hidden->opened = 1;
  pthread_mutex_unlock(&_this->hidden->mutex);

  // Do not create an audio thread.
  return 1;
}
} // extern "C"
