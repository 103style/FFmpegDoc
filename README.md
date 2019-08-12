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
[GetDependencies](https://github.com/103style/FFmpegDoc/blob/master/GetDependencies.md)

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

