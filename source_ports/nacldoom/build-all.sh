#!/bin/bash

set -o errexit
set -o nounset

./build-bzip2.sh $1
./build-sdl.sh $1
./build-doom.sh $1
