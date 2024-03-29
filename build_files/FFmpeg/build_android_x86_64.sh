#!/bin/bash
#Change NDK to your Android NDK location

cd $HOME/FFmpeg

NDK=$ANDROID_NDK_ROOT
PLATFORM=$NDK/platforms/android-21/arch-x86_64/
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib
PREFIX=$HOME/FFmpegBuild/x86_64



GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--cc=$PREBUILT/bin/x86_64-linux-android-gcc \
--cross-prefix=$PREBUILT/bin/x86_64-linux-android- \
--nm=$PREBUILT/bin/x86_64-linux-android-nm \
--extra-cflags="-I$X264DIR/x86_64/include" \
--extra-ldflags="-L$X264DIR/x86_64/lib" "

MODULES="\
--enable-gpl \
--enable-libx264"


function build_x86_64
{
  ./configure \
  --logfile=conflog.txt \
  --target-os=linux \
  --prefix=$PREFIX \
  --arch=x86_64 \
  ${GENERAL} \
  --sysroot=$PLATFORM \
  --extra-cflags="-march=x86-64 -msse4.2 -mpopcnt -m64 -mtune=intel" \
  --enable-shared \
  --disable-static \
  --extra-ldflags="-lx264 -Wl,-rpath-link=$PLATFORM/usr/lib64 -L$PLATFORM/usr/lib64 -nostdlib -lc -lm -ldl -llog" \
  --enable-zlib \
  --disable-doc \
  ${MODULES}

  make clean
  make -j4
  make install
}

build_x86_64


echo Android X86_64 builds finished
