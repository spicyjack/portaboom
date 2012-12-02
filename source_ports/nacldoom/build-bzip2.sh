#!/bin/bash

set -o errexit
set -o nounset

tc=$1
source setup-tools.sh

cd bzip2-nacl

make clean
env -i make \
  CC=${NACL_CC} \
  CXX=${NACL_CXX} \
  AR=${NACL_AR} \
  RANLIB=${NACL_RANLIB} \
  libbz2.a

env -i make \
  CC=${NACL_CC} \
  CXX=${NACL_CXX} \
  AR=${NACL_AR} \
  RANLIB=${NACL_RANLIB} \
  PREFIX=${DEST_ROOT}/bzip2-nacl-install install

