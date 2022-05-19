#! /usr/bin/env bash
#########################################################################
# File Name: autostart.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月19日 星期四 17时52分51秒

# 此程序的功能是：
#########################################################################




# tray icons(eDP1 is the display device's name, use the command "xrandr" to see the display device name.)
# 其中的eDP1便是我的显示设备名称。如果你的显示设备名称不是eDP1 ，那么需要修改
xrandr --output eDP-1 --primary

# 如果为笔记本外接两个显示器，关闭笔记本的显示器
# xrandr --output DP-1-8 --mode 1920x1080 --primary
# xrandr --output DP-1-9 --mode 1920x1080  --right-of DP-1-8  --auto
# xrandr  --output eDP-1 --off


# 如果为笔记本外接1个显示器
#  xrandr --output eDP-1 --mode 1920x1080 --primary
# xrandr --output HDMI1 1920*1080 --right-of eDP1



# 如果为台式机外接2个显示器
#  xrandr --output HDM-1 --mode 1920x1080 --primary
#  xrandr --output HDMI-2  1920*1080 --right-of HDM-1

# $i3-background
xsetroot -solid '#005577'

#以 exec 和 exec_always 开头的是设置自动启动程序，exec_always 会在重启 i3 时跟着重启。
xss-lock --transfer-sleep-lock -- i3lock --nofork

# 把 nm-applet 开起来，用于显示网络托盘图标，需要安装 gnome-extra/nm-applet
nm-applet &

# 锁屏工具
xscreensaver -no-splash &


# exec --no-startup-id conky -c ~/.conkyrc

# 在每次注销或者刷新i3wm时自动执行nitrogen并刷新壁纸
nitrogen --restore; sleep 2
#variety设置壁纸时候，普通用户必须有权限
nohup  variety   >  /dev/null  2>&1 &



# 护眼工具
#redshift
redshift-gtk &

#===autostart parograms只可以同时启用其中一种===
picom --experimental-backends -b
#  compton -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88

#登录时 启用窗口透明
# compton  -b

#  xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

#登陆时 随机选择壁纸 ，~/Pictures/DesktopBackground 下要放几张图片
feh --recursive --randomize --bg-fill /home/jack/图片/Wallpapers/

# 登陆时 随机选择壁纸,并每隔一段时间就更改壁纸 ，~/Pictures/DesktopBackground 下要放几张图片
# bash  ~/.config/i3/i3script/wallpaper.sh &

# 火焰截图
nohup flameshot >/dev/null 2>&1  &

# 桌面通知
dunst &

# 剪切板管理器
copyq &

# 开启小键盘
numlockx on # 开启小键盘yq &

# 无论何时都执行
# exec_always --no-startup-id fcitx
# 启动i3时执行,重启i3时不执行
fcitx  &
# exec --no-startup-id fcitx-sogoupingyin
# fcitx5 输入法
#  fcitx5 &

#音频相关的托盘
# 系统托盘图标：pasystray
nohup   pasystray     >  /dev/null  2>&1 &
# KMix — KDE 音量控制应用程序支持多个平台，包括 PulseAudio、可配置的系统托盘小程序。
nohup   kmix     >  /dev/null  2>&1 &
# pa-applet — 带有音量条的 PulseAudio 系统托盘小程序。
nohup   /foo/bar/bin/pa-applet       >  /dev/null  2>&1 &
#轻量级系统托盘应用程序，可让您使用 PulseAudio 控制麦克风状态和音量,上下滚轮调节输入音大小。
nohup   mictray       >  /dev/null  2>&1 &


# 登陆时启动polybar,与bar{}别同时使用
# exec_always --no-startup-id $HOME/.config/polybar/launch.sh

xautolock -time 5 -locker '/usr/bin/betterlockscreen -l' -corners ---- -cornersize 30 &
betterlockscreen -w dim
source ~/.fehbg

