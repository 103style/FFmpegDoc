# FFmpegDoc

### 笔者环境
```
Ubutun : 16.04
NDK : r15c
```

---

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

安装指引:[GetDependencies](https://github.com/103style/FFmpegDoc/blob/master/GetDependencies.md)

---

### 编译 x264
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


如果提示以下内容：
```
No working C compiler found.
Makefile:3: config.mak: 没有那个文件或目录
./configure
Found no assembler
Minimum version is nasm-2.13
If you really want to compile without asm, configure with --disable-asm.
Makefile:332: recipe for target 'config.mak' failed
```
则需要更新 `nasm`
```
nasm -v
```
如果提示 version < 2.13，则先卸载 `nasm`，如果提示找不到命令,则进行安装。
卸载命令：
```
sudo apt-get --purge remove nasm
```

然后安装
```
cd $HOME && \
wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2 && \
tar xjvf nasm-2.14.02.tar.bz2 && \
cd nasm-2.14.02 && sudo bash ./autogen.sh && sudo PATH="/usr/bin:$PATH" sudo ./configure --prefix="$HOME/ffmpeg_build" --bindir="/usr/bin" && sudo make -j4 && sudo make install
```

然后检查 `nasm` 版本
```
nasm -v
```



---

### 编译FFmpeg

### 下载源代码到`$HOME`目录
[https://github.com/FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg)
```
cd $HOME
git clone https://github.com/FFmpeg/FFmpeg.git
```

---

### 切换最新的release分支
```
cd FFmpeg
git branch -a
```
选择最新的 `4.2` 版本
```
git checkout -b remotes/origin/release/4.2
```

---

### 修改FFmpeg的configure
>下载FFmpeg源代码之后，首先需要对源代码中的configure文件进行修改。由于编译出来的动态库文件名的版本号在.so之后（例如“libavcodec.so.5.100.1”），而android平台不能识别这样文件名，所以需要修改这种文件名。

在`configure`文件中找到下面几行代码：
```
SLIBNAME_WITH_MAJOR='$(SLIBNAME).$(LIBMAJOR)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB)"$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_VERSION)'
SLIB_INSTALL_LINKS='$(SLIBNAME_WITH_MAJOR)$(SLIBNAME)'
```
替换为下面内容就可以了：
```
SLIBNAME_WITH_MAJOR='$(SLIBPREF)$(FULLNAME)-$(LIBMAJOR)$(SLIBSUF)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB)"$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_MAJOR)'
SLIB_INSTALL_LINKS='$(SLIBNAME)
```

---

