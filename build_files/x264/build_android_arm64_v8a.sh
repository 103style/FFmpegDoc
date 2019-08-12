#!/bin/bash

cd $HOME/x264

NDK=$ANDROID_NDK_ROOT
PLATFORM=$NDK/platforms/android-21/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$X264DIR/arm64
CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-


function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=aarch64-linux \
  --cross-prefix=$CROSS_PREFIX \
  --sysroot=$PLATFORM

  make clean
  make -j4
  make install
}

build_one

echo Android ARM64 builds finished

