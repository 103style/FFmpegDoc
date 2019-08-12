### Get the Dependencies

`安装报错请往下看。`
```
sudo apt-get update -qq && sudo apt-get -y install \
autoconf \
automake \
build-essential \
cmake \
git-core \
libass-dev \
libfreetype6-dev \
libsdl2-dev \
libtool \
libva-dev \
libvdpau-dev \
libvorbis-dev \
libxcb1-dev \
libxcb-shm0-dev \
libxcb-xfixes0-dev \
pkg-config \
texinfo \
wget \
zlib1g-dev
```
如果出现类似下列打印信息：`xxx:依赖: xxx 但是它将不会被安装`
```
libass-dev : 依赖: libfontconfig1-dev 但是它将不会被安装
            依赖: libharfbuzz-dev 但是它将不会被安装
```
解决办法：安装 `aptitude` 工具
```
sudo apt-get install aptitude 
```
然后修改运行一下指令，
```
sudo apt-get update -qq && sudo aptitude -y install \
autoconf \
automake \
build-essential \
cmake \
git-core \
libass-dev \
libfreetype6-dev \
libsdl2-dev \
libtool \
libva-dev \
libvdpau-dev \
libvorbis-dev \
libxcb1-dev \
libxcb-shm0-dev \
libxcb-xfixes0-dev \
pkg-config \
texinfo \
wget \
zlib1g-dev
```
