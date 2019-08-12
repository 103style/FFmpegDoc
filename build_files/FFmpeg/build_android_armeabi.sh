#!/bin/bash
#Change NDK to your Android NDK location

cd $HOME/FFmpeg

NDK=$HOME/android-ndk-r15c
PLATFORM=$NDK/platforms/android-21/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib 
PREFIX=$HOME/FFmpegBuild/armeabi
CROSSPREFIX=$PREBUILT/bin/arm-linux-androideabi-
NM=$PREBUILT/bin/arm-linux-androideabi-nm
CC=$PREBUILT/bin/arm-linux-androideabi-gcc

GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--arch=arm \
--cc=$CC \
--cross-prefix=$CROSSPREFIX \
--nm=$NM \
--extra-cflags="-I$X264DIR/arm/include" \
--extra-ldflags="-L$X264DIR/arm/lib" "


MODULES="\
--enable-gpl \
--enable-libx264"

function build_ARMv6
{
  ./configure \
  --target-os=linux \
  --prefix=$PREFIX \
  ${GENERAL} \
  --sysroot=$PLATFORM \
  --enable-shared \
  --disable-static \
  --extra-cflags=" -O3 -fpic -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300 -mfloat-abi=softfp -mfpu=vfp -marm -march=armv6" \
  --extra-ldflags="-lx264 -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
  --enable-zlib \
  ${MODULES} \
  --disable-doc \
  --enable-neon

  make clean
  make -j4
  make install
}


build_ARMv6

echo Android ARMEABI builds finished
