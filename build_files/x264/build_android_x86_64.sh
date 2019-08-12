#!/bin/bash

cd $HOME/x264

NDK=$ANDROID_NDK_ROOT
PLATFORM=$NDK/platforms/android-21/arch-x86_64/
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$X264DIR/x86_64
CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-


function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=x86_64-linux \
  --disable-asm \
  --cross-prefix=$CROSS_PREFIX \
  --sysroot=$PLATFORM

  make clean
  make -j4
  make install
}

build_one

echo Android x86_64 builds finished

