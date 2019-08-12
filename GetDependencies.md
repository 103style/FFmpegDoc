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
然后修改运行以下命令：
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

如果出现类似下面的报错
```
无法下载 http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages  无法发起与 dl.google.com:80 (2404:6800:4005:805::200e) 的连接 - connect (101: 网络不可达)
```
则使用Ubuntu国内镜像： [镜像地址](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)
```
sudo chmod -R 777 /etc/apt/sources.list
gedit /etc/apt/sources.list
```
添加上面链接中的镜像地址到最后。

然后注释掉 `/etc/apt/sources.list.d/google-chrome.list`中的源
```
sudo gedit /etc/apt/sources.list.d/google-chrome.list
```

修改为以下内容
```
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
# deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
```

然后再次运行以下命令：
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



