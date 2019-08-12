#!/bin/bash

cd $HOME/x264

NDK=/home/xiaoke/android-ndk-r15c
PLATFORM=$NDK/platforms/android-21/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$X264DIR/x86
CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android-

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=i686-linux \
  --disable-asm \
  --cross-prefix=$CROSS_PREFIX \
  --sysroot=$PLATFORM

  make clean
  make -j4
  make install
}

build_one

echo Android x86 builds finished

