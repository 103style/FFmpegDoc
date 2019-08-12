# FFmpegDoc

### 笔者环境
```
Ubutun : 16.04
NDK : r15c
```

### 下载文件

* 克隆到 `$HOME` 目录，`(e.g.  /home/103style/)`

* 配置`NDK`环境变量 `ANDROID_NDK_ROOT`
  ```
  sudo gedit /etc/profile
  ```

  在`profile`最后新增一下语句,修改`/home/103style/android-ndk-r15c`为你的`NDK`目录
  ```
  export ANDROID_NDK_ROOT=/home/103style/android-ndk-r15c
  ```

### 安装依赖
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


### 编译　x264
* 全平台编译
  ```
  cd ./build_files/x264/
  bash ./build_android_all.sh 
  ```
  
* `arm`平台编译
  ```
  cd ./build_files/x264/
  bash ./build_android_arm.sh 
  ```
  
编译完成，会在`$HOME/x264_lib/` `e.g. /home/103style/x264_lib/`目录下生成对应平台的文件

