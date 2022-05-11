#! /usr/bin/env bash
#########################################################################
# File Name: toggletouchpad.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月11日 星期三 15时34分40秒

# 此程序的功能是：
#########################################################################


if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 ;
else
    synclient TouchpadOff=0 ;
fi
