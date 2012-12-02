#include <stdio.h>
#include <string.h>

extern const unsigned int doom1_wad_size;
extern const char *doom1_wad;

static FILE placeholder;
unsigned doom1_wad_pos = 0;

FILE *nacl_fopen(const char *path, const char *mode) {
  if (strcmp(path, "./doom1.wad")) {
    printf("nacl_fopen: Cannot open %s\n", path);
    return NULL;
  }
  printf("Opening %s with mode %s\n", path, mode);
  return &placeholder;
}

size_t nacl_fread(void *ptr, size_t size, size_t nmemb, FILE *stream) {
  size_t endpos;
  size_t ret;
  size_t bytes_to_read;
  if (stream != &placeholder) {
    printf("Tried fread() on invalid file!\n");
    return 0;
  }
  bytes_to_read = size*nmemb;
  ret = nmemb;
  if (doom1_wad_pos + bytes_to_read > doom1_wad_size) {
    ret = (doom1_wad_size - doom1_wad_pos)/size;
    bytes_to_read = ret*size;
  }
  memcpy(ptr, doom1_wad + doom1_wad_pos, bytes_to_read);
  doom1_wad_pos += bytes_to_read;
  return ret;
}


size_t nacl_fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream) {
  printf("fwrite() not implemented\n");
}


int nacl_fseek(FILE *stream, long offset, int whence) {
  if (stream != &placeholder) {
    printf("Tried fread() on invalid file!\n");
    return 0;
  }
  switch (whence) {
  case SEEK_SET: doom1_wad_pos = 0; break;
  case SEEK_CUR: break;
  case SEEK_END: doom1_wad_pos = doom1_wad_size; break;
  }
  doom1_wad_pos += offset;
  return 0;
}

long nacl_ftell(FILE *stream) {
  if (stream != &placeholder) {
    printf("Tried fread() on invalid file!\n");
    return -1;
  }
  return doom1_wad_pos;
}

int nacl_fclose(FILE *fp) {
  if (fp != &placeholder) {
    printf("Tried fclose() on invalid file!\n");
    return EOF;
  }
  return 0;
}

int nacl_fprintf(FILE *stream, const char *format, ...) {
  printf("fprintf() not supported\n");
  return 0;
}
