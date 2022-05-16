

# i3WM安装与配置


## 安装 字体  例如apple的Yosemite San Francisco的ttf文件,

```bash
cd  /usr/share/fonts/truetype       

sudo mkdir  YosemiteSanFrancisco

cd YosemiteSanFrancisco

sudo cp ~/文档/Fonts/YosemiteSanFranciscoFont/*  .

creatfont

cd  /usr/share/fonts/truetype       

sudo mkdir  myfont

cd myfont

sudo  find ~/文档/Fonts/AllNerdFont -name "*.*" -exec cp -r {} . \; 

creatfont

cd
```




## 安装picom 

```bash
cd ~/tmp
sudo apt install cmake meson git pkg-config asciidoc libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
git clone https://github.com/jonaburg/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
LDFLAGS="-L/path/to/libraries" CPPFLAGS="-I/path/to/headers" meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd
# 有时使用像 双河濑 你需要指定 – 实验后端 标志如下：
$ picom --config  ~/.config/picom/picom.conf --experimental-backends -b
$ picom --experimental-backends -b


sudo apt install compton xcompmgr
```bash

```


## 安装 i3-gaps

```bash
sudo add-apt-repository ppa:regolith-linux/release

sudo apt update

sudo apt install i3-gaps
```



##  安装polybar



```bash

sudo  echo "deb http://cz.archive.ubuntu.com/ubuntu groovy main universe" >>/etc/apt/sources.list
sudo  apt updade

sudo  apt install -y polybar


```
## 安装 其他服务软件



```bash
sudo  apt install -y suckless-tools libx11-dev libxft-dev libxinerama-dev gcc make feh

sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool

sudo apt-get install automake

sudo apt-get install libxcb-xrm-dev


sudo apt install libxcb-shape0-dev

sudo apt-get install libpcre3-dev

sudo apt-get install libcairo2-dev

sudo apt-get install libpango1.0-dev
```

##  i3status 状态栏

```bash
sudo apt-get install autoconf libconfuse-dev libyajl-dev libasound2-dev libiw-dev asciidoc libpulse-dev libnl-genl-3-dev meson


https://i3wm.org/i3status/  下载i3status安装包
解压缩
cd i3status-2/.14

╭─   ~/下载/i3status-2.14/                                                                                                                                                       ✘ INT  base at  17:49:48
╰─❯

  mkdir build

  cd build

  meson ..

  ninja

  sudo ninja install
```





## dunst



```bash

sudo apt install dunst

或

sudo apt install libnotify-dev  libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev


cd ~/tmp
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install
```



## i3blocks 状态栏





```bash
cd ~/tmp

git clone https://github.com/vivien/i3blocks.git


cd i3blocks
./autogen.sh
./configure
sudo make
sudo make install

安装i3block的其他配置工具
sudo apt install  kbdd    yad xdotool
```

## 安装 i3lock




```bash
sudo apt-get install i3lock


```


##  i3lock-fancy 

```bash


cd ~/tmp

git clone https://github.com/meskarune/i3lock-fancy.git

cd i3lock-fancy

sudo make install

cd
```





##  i3lock-color 

```bash
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev

sudo apt install libpam0g-dev


git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color

./build.sh

./install-i3lock-color.sh
```





## 锁屏管理器：betterlockscreen, xautolock

依赖以下：

+ i3lock-color >= 2.13.c.3
+ ImageMagick
+ xdpyinfo, xrandr, xrdb and xset from X.Org
+ (Optional) Dunst
+ (Optional) feh for wallpaper-functionality

Note: Make sure your system has all dependencies satisfied

```bash
wget https://github.com/pavanjadhaw/betterlockscreen/archive/refs/heads/main.zip
unzip main.zip

cd betterlockscreen-main/
chmod u+x betterlockscreen
cp betterlockscreen /usr/local/bin/

cp system/betterlockscreen@.service /usr/lib/systemd/system/
systemctl enable betterlockscreen@$USER


sudo apt install xautolock
```



## 配套小工具

```bash

## 背光灯调整工具

sudo  apt install -y light

## 安装数字键盘工具, 用于进入dwm桌面后自动开启数字键盘 #
sudo  apt install -y numlockx

sudo  apt install -y virtualbox-guest-utils virtualbox-guest-X11

##  电源监控工具 #
sudo  apt install -y acpi acpitool

## 透明配置支持  
sudo  apt install -y compton

sudo  apt install -y xcompmg

## 背景图片设置工具
sudo  apt install -y feh

## 用于屏幕亮度的调节
sudo  apt install -y   light  xbacklight

## 安装 nm-applet
sudo  apt install -y network-manager-gnome

##  锁屏 
sudo  apt install slimlock  i3lock-fancy


##  蓝牙 

sudo apt install blueman


sudo apt install alsa-utils  mate-power-manager  acpi  alsa-utils nitrogen xsetroot

# mate-power-manager 电源管理工具
# acpi 电源配置接口工具(用于显示电池信息)
# alsa-utils 声音管理
# xfce4-appfinder 可以快速搜索程序的启动器
# nitrogen 壁纸管理器
# xsetroot  定制、显示简易的系统状态栏(电池电量、音量、日期、时间等)


# 使用Playerctl的通用媒体播放器状态/控件
sudo apt install  playerctl

#mpd是作为一个服务运行在后台，它不具备播放功能，你可以把它理解成一个服务端，你还需要一个客户端MPC来执行播放的功能。
sudo apt-get install mpd mpc

## rofi 是一个快捷的程序启动器
sudo  apt install -y rofi 




```



## 安装dwmstatus 
```bash
git clone git://git.suckless.org/dwmstatus
cd dwmstatus
make
sudo ake PREFIX=/usr install
cd


```





## 护眼工具redshift

`sudo apt-get update`



``sudo apt-get install redshift-gtk`





##  Spotify是一个音乐流媒体服务商






```bash

sudo snap install spotify

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45



echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list


sudo apt update
sudo apt install spotify-client




