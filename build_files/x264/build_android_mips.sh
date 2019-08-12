#!/bin/bash

cd $HOME/FFmpegDoc/x264

NDK=$ANDROID_NDK_ROOT
PLATFORM=$NDK/platforms/android-21/arch-mips/
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$X264DIR/mips
CROSS_PREFIX=$TOOLCHAIN/bin/mipsel-linux-android-

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=mipsel-linux \
  --cross-prefix=$CROSS_PREFIX \
  --sysroot=$PLATFORM \

  make clean
  make -j4
  make install
}

build_one

echo Android MIPS builds finished

