#!/bin/bash


cd $HOME/x264

NDK=/home/xiaoke/android-ndk-r15c
PLATFORM=$NDK/platforms/android-21/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$X264DIR/arm
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=arm-linux \
  --cross-prefix=$CROSS_PREFIX\
  --sysroot=$PLATFORM

  make clean
  make -j4
  make install
}

build_one

echo Android ARM builds finished

