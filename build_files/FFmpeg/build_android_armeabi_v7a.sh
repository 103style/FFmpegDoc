#!/bin/bash
#Change NDK to your Android NDK location

cd $HOME/FFmpeg

NDK=$HOME/android-ndk-r15c
PLATFORM=$NDK/platforms/android-21/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
X264DIR=$HOME/x264_lib
PREFIX=$HOME/FFmpegBuild/armeabi-v7a


GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--arch=arm \
--cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
--nm=$PREBUILT/bin/arm-linux-androideabi-nm \
--extra-cflags="-I$X264DIR/arm/include" \
--extra-ldflags="-L$X264DIR/arm/lib" "


MODULES="\
--enable-gpl \
--enable-libx264"

function build_ARMv7
{
	./configure \
	--target-os=linux \
	--prefix=$PREFIX \
	${GENERAL} \
	--sysroot=$PLATFORM \
	--enable-shared \
	--disable-static \
	--extra-cflags="-DANDROID -fPIC -ffunction-sections -funwind-tables -fstack-protector -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -fomit-frame-pointer -fstrict-aliasing -funswitch-loops -finline-limit=300" \
	--extra-ldflags="-Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
	--enable-zlib \
	${MODULES} \
	--disable-doc \
	--enable-neon
	
	make clean
	make -j4
	make install
}

build_ARMv7
echo Android ARMv7-a builds finished
