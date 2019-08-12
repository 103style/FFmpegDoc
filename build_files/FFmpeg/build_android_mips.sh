#!/bin/bash
#Change NDK to your Android NDK location

cd $HOME/FFmpeg

NDK=$HOME/android-ndk-r15c
PLATFORM=$NDK/platforms/android-21/arch-mips/
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib
PREFIX=$HOME/FFmpegBuild/mips



GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--cc=$PREBUILT/bin/mipsel-linux-android-gcc \
--cross-prefix=$PREBUILT/bin/mipsel-linux-android- \
--nm=$PREBUILT/bin/mipsel-linux-android-nm \
--extra-cflags="-I$X264DIR/mips/include" \
--extra-ldflags="-L$X264DIR/mips/lib""

MODULES="\
--enable-gpl \
--enable-libx264"


function build_mips
{
  ./configure \
  --logfile=conflog.txt \
  --target-os=linux \
  --prefix=$PREFIX \
  --arch=mips \
  ${GENERAL} \
  --sysroot=$PLATFORM \
  --enable-shared \
  --disable-static \
  --disable-mipsdspr1 --disable-mipsdspr2 --disable-mipsfpu \
  --extra-ldflags="-lx264 -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
  --enable-zlib \
  --disable-doc \
  ${MODULES}

  make clean
  make -j4
  make install
}

build_mips


echo Android MIPS builds finished

