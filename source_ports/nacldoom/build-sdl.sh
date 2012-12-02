#!/bin/bash

set -o errexit
set -o nounset

tc=$1
source setup-tools.sh

cd sdl-nacl
rm -f config.log
rm -f config.status
rm -f configure

./autogen.sh

cd ..

rm -rf sdl-nacl-build
mkdir sdl-nacl-build
cd sdl-nacl-build

env -i \
  CC=${NACL_CC} \
  CXX=${NACL_CXX} \
  LD=${NACL_CXX} \
  AR=${NACL_AR} \
  RANLIB=${NACL_RANLIB} \
  ../sdl-nacl/configure --enable-naclvideo --enable-naclaudio --disable-pulseaudio \
    --host=${NACL_PREFIX} --prefix=${DEST_ROOT}/sdl-nacl-install

make -j4

make install
