#!/bin/bash
#Change NDK to your Android NDK location


cd $HOME/FFmpeg

NDK=$ANDROID_NDK_ROOT
PLATFORM=$NDK/platforms/android-21/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib
PREFIX=$HOME/FFmpegBuild/arm64-v8a


GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--arch=aarch64 \
--cc=$PREBUILT/bin/aarch64-linux-android-gcc \
--cross-prefix=$PREBUILT/bin/aarch64-linux-android- \
--nm=$PREBUILT/bin/aarch64-linux-android-nm \
--extra-cflags="-I$X264DIR/arm64/include" \
--extra-ldflags="-L$X264DIR/arm64/lib" "

MODULES="\
--enable-gpl \
--enable-libx264"



function build_arm64
{
	./configure \
	--logfile=conflog.txt \
	--target-os=linux \
	--prefix=$PREFIX \
	${GENERAL} \
	--sysroot=$PLATFORM \
	--extra-cflags="" \
	--extra-ldflags="-lx264 -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
	--enable-shared \
	--disable-static \
	--disable-doc \
	--enable-zlib \
	${MODULES}
	
	make clean
	make -j4
	make install
}
	
build_arm64


echo Android ARM64 builds finished
