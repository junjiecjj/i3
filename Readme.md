

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

#查看电脑系统信息
sudo  apt install  screenfetch  neofetch



#终端 文件管理器
sudo  apt install ranger

#图形界面 文件管理器
sudo  apt install  nautilus  thunar

#文本编辑器
sudo  apt install  mousepad（xfce）
sudo  apt install  kwrite（kde）

#setings，鼠标，图标等自定义
sudo  apt install  lxappearance


#视频播放器
sudo  apt install  mpv vlc

#deepin 截图工具
sudo  apt install  deepin-screenshot
#火焰截图
sudo  apt install  flameshot

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

nm-applet
network-manager-applet 是一个GTK3+前端小程序，工作在Xorg环境下，带有一个系统托盘。

## 背景图片设置工具
sudo  apt install  variety
#i3 配置文件中添加
exec_always variety -b
#variety设置壁纸时候，普通用户必须有权限
#简单点，直接把壁纸 所有权限设成 777

```



## 网络系统托盘



NetworkManager可以通过networkmanager包安装。这个包包括了一个daemon、一个命令行界面(nmcli)和一个基于curses的界面(nmtui)。安装好之后需要[启动/启用](https://wiki.archlinux.org/title/Systemd_(简体中文)#使用单元) `NetworkManager.service` [systemd](https://wiki.archlinux.org/title/Systemd) 服务。NetworkManager 守护进程启动后，会自动连接到任何可用的已经配置的**系统连接**。**用户连接**或未配置的连接需要通过`nmcli`或applet进行配置和连接。

`systemctl start  network-manager`

立即激活单元：

```
# systemctl start <单元>
```

立即停止单元：

```
# systemctl stop <单元>
```

重启单元：

```
# systemctl restart <单元>
```

重新加载配置：

```
# systemctl reload <单元>
```



```bash
╭─   ~/.config/i3 on   main !1                                                                                                                                                              base at  17:27:26
╰─❯ sudo apt install network-manager
 -- package --
network-manager                             network-manager-gnome                       network-manager-openconnect-gnome           network-manager-ssh-gnome
network-manager-config-connectivity-debian  network-manager-iodine                      network-manager-openvpn                     network-manager-strongswan
network-manager-config-connectivity-ubuntu  network-manager-iodine-gnome                network-manager-openvpn-gnome               network-manager-vpnc
network-manager-dev                         network-manager-l2tp                        network-manager-pptp                        network-manager-vpnc-gnome
network-manager-fortisslvpn                 network-manager-l2tp-gnome                  network-manager-pptp-gnome
network-manager-fortisslvpn-gnome           network-manager-openconnect                 network-manager-ssh



```

NetworkManager安装完成后，` sudo apt install network-manager`, 自带：

+  提供图形界面 nm-connection-editor
+ 提供系统托盘图标 network-manager-applet(nm-applet) 

```bash
nmcli 使用示例

1、列出附近wifi
nmcli   dev  wifi    list



#显示附近的 wifi:
❯ nmcli device wifi list
IN-USE  BSSID              SSID                 MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
        4C:77:66:D5:A2:45  409                  Infra  13    270 Mbit/s  97      ▂▄▆█  WPA1 WPA2
        08:40:F3:5D:FB:E1  cmcc                 Infra  5     270 Mbit/s  79      ▂▄▆_  WPA1 WPA2
        08:40:F3:5D:FB:E5  cmcc                 Infra  161   270 Mbit/s  79      ▂▄▆_  WPA1 WPA2
        BC:5F:F6:50:53:52  406                  Infra  12    270 Mbit/s  62      ▂▄▆_  WPA1 WPA2
*       D4:8F:A2:C7:34:88  .小酒馆mm            Infra  1     130 Mbit/s  52      ▂▄__  WPA1 WPA2
        D4:8F:A2:C7:34:8D  --                   Infra  1     130 Mbit/s  40      ▂▄__  WPA2
        C0:C1:70:62:DB:B0  CMCC-v5ad            Infra  8     130 Mbit/s  40      ▂▄__  WPA1 WPA2
        50:0F:F5:E9:4F:D1  Tenda_E94FD0         Infra  4     130 Mbit/s  35      ▂▄__  WPA1 WPA2
        90:76:9F:D2:2D:5F  MERCURY_5G_2D5F      Infra  153   270 Mbit/s  34      ▂▄__  WPA1 WPA2
        50:21:EC:97:36:1C  江西特色饭店         Infra  44    270 Mbit/s  30      ▂___  WPA2
        50:0F:F5:E9:4F:D5  Tenda_E94FD0_5G      Infra  48    540 Mbit/s  30      ▂___  WPA1 WPA2
        50:21:EC:F7:36:1E  江西特色饭店_Wi-Fi5  Infra  44    270 Mbit/s  29      ▂___  WPA2
        28:2C:B2:06:CD:D0  lzw                  Infra  1     135 Mbit/s  25      ▂___  WPA1 WPA2
        34:78:39:53:71:08  threedou2            Infra  8     270 Mbit/s  24      ▂___  WPA1 WPA2
        D4:8F:A2:C7:34:8E  --                   Infra  44    270 Mbit/s  24      ▂___  WPA2
        E4:19:C1:F3:55:B1  --                   Infra  1     270 Mbit/s  22      ▂___  WPA2
        04:40:A9:B1:F5:B2  qianyicangku         Infra  6     130 Mbit/s  22      ▂___  WPA1 WPA2
        D4:8F:A2:C7:34:8C  .小酒馆mm            Infra  44    270 Mbit/s  22      ▂___  WPA1 WPA2
        E4:19:C1:F3:55:B0  ChinaNet-D6UQLT      Infra  153   270 Mbit/s  22      ▂___  WPA1 WPA2
        F4:B5:AA:C6:A0:D8  ChinaNet-G2hg        Infra  3     130 Mbit/s  20      ▂___  WPA1 WPA2
        EC:F8:EB:47:D9:B1  ChinaNet-t4za        Infra  5     130 Mbit/s  20      ▂___  WPA1
        8C:81:72:5F:85:D4  ChinaNet-awAe        Infra  9     130 Mbit/s  20      ▂___  WPA1 WPA2
        58:41:20:5C:AB:D0  办公                 Infra  153   405 Mbit/s  20      ▂___  WPA1 WPA2
        C0:C1:70:62:DB:B1  CMCC-v5ad-5G         Infra  149   270 Mbit/s  19      ▂___  WPA1 WPA2
        04:40:A9:B1:F5:B6  qianyicangku_5G      Infra  153   270 Mbit/s  19      ▂___  WPA1 WPA2
        E4:19:C1:F3:55:B2  --                   Infra  153   270 Mbit/s  19      ▂___  WPA2
        D8:32:14:EF:61:B5  888-5G               Infra  153   270 Mbit/s  15      ▂___  WPA1 WPA2

2、连接wifi
nmcli  dev  wifi  connect  <name>  password  <password>    不指定网卡连接wifi
nmcli   dev  wifi  connect  <name>  password  <password>  ifname  wlan1 [profile_name] 指定网卡

连接 wifi:
$ nmcli device wifi connect 409 password 8888888

3、 查看设备列表
nmcli dev 其中dev是device的简写，wifi是类型，也就是说可以使用类型来引用设备,也可以使用iface和ifname来引用设备，iface是编号，ifname是网卡接口名，例如wlan0

4、打开图形配置界面
文本界面：nmtui
图形界面：nm-connection-editor


#连接到隐藏的 wifi:
$ nmcli device wifi connect SSID password password hidden yes


通过 wlan1 wifi 网卡(interface)连接 wifi:
$ nmcli device wifi connect <SSID>  password <password> ifname wlan1 <profile_name>


断开一个网卡(interface)上的连接:
$ nmcli device disconnect ifname eth0

重新连接一个被标记为“已断开”的网卡：
$ nmcli connection up uuid UUID


显示一个所有连接过的网络的UUID的列表:
$ nmcli connection show


查看所有网络设备及其状态:
$ nmcli device
❯ nmcli device
DEVICE           TYPE      STATE   CONNECTION
wlp59s0          wifi      已连接  .小酒馆mm
p2p-dev-wlp59s0  wifi-p2p  已断开  --
lo               loopback  未托管  --



关掉 wifi:
$ nmcli radio wifi off
```







### nmcli 使用示例

显示附近的 wifi:

```bash
$ nmcli device wifi list
```

连接 wifi:

```bash
$ nmcli device wifi connect SSID password password
```

连接到隐藏的 wifi:

```bash
$ nmcli device wifi connect SSID password password hidden yes
```

通过 `wlan1` wifi 网卡(interface)连接 wifi:

```bash
$ nmcli device wifi connect SSID password password ifname wlan1 profile_name
```

断开一个网卡(interface)上的连接:

```bash
$ nmcli device disconnect ifname eth0
```

重新连接一个被标记为“已断开”的网卡：

```bash
$ nmcli connection up uuid UUID
```

显示一个所有连接过的网络的UUID的列表:

```bash
$ nmcli connection show
```

查看所有网络设备及其状态:

```bash
$ nmcli device
```

关掉 wifi:

```bash
$ nmcli radio wifi off
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




