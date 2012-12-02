#!/bin/bash

DEST_ROOT=$(pwd)

case ${tc} in
  sdk32)
    NACL_ROOT=$(pwd)/sdk/toolchain/linux_x86
    NACL_PREFIX=nacl
    ;;
  sdk64)
    NACL_ROOT=$(pwd)/sdk/toolchain/linux_x86
    NACL_PREFIX=nacl64
    ;;
  nacl32)
    NACL_ROOT=$(pwd)/nacl-repo/native_client/toolchain/linux_x86_newlib
    NACL_PREFIX=nacl
    ;;
  nacl64)
    NACL_ROOT=$(pwd)/nacl-repo/native_client/toolchain/linux_x86_newlib
    NACL_PREFIX=nacl64
    ;;
  pnacl)
    NACL_ROOT=$(pwd)/nacl-repo/native_client/toolchain/pnacl_linux_x86_64
    NACL_PREFIX=pnacl
    ;;
esac

echo Using toolchain: ${NACL_ROOT} ${NACL_PREFIX}

NACL_CC=${NACL_ROOT}/bin/${NACL_PREFIX}-gcc
NACL_CXX=${NACL_ROOT}/bin/${NACL_PREFIX}-g++
NACL_AR=${NACL_ROOT}/bin/${NACL_PREFIX}-ar
NACL_RANLIB=${NACL_ROOT}/bin/${NACL_PREFIX}-ranlib
NACL_STRIP=${NACL_ROOT}/bin/${NACL_PREFIX}-strip
