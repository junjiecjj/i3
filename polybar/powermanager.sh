#! /usr/bin/env bash
#########################################################################
# File Name: powermanager.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月12日 星期四 23时12分57秒

# 此程序的功能是：
#########################################################################


function save(){
    notify-send "虚拟机正在保存, 请稍等..."
    vboxmanage controlvm win7 savestate
    vboxmanage controlvm win7-home savestate
    notify-send "虚拟机保存完毕."
}
if [ "exit" == "$1" ];then
    save
    i3-msg exit
elif [ "reboot" == "$1" ];then
    save
    sudo reboot
elif [ "poweroff" == "$1" ];then
    save
    sudo poweroff
else
    exit 1
fi
