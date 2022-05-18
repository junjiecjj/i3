#! /usr/bin/env bash
#########################################################################
# File Name: wallpaper.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月11日 星期三 18时38分41秒

# 此程序的功能是：
#########################################################################


while true; do

    results=$(ps ax|grep -v grep|grep wallpaper)
    # echo  $results
    if [ "${results}" == "" ];then
        echo  "没有正在运行的autochange Wallpaper程序"
        feh --recursive --randomize --bg-fill ~/图片/Wallpapers/
    else
        echo  "有正在运行的自动更改壁纸程序，先杀掉已有的，再重启一个..."
        echo   "当前脚本的进程id: $$"
        ps -ef | grep wallpaper | grep -v grep |grep -v nvim | grep -v $$ |  awk '{print $2}' | xargs kill -9
        feh --recursive --randomize --bg-fill ~/图片/Wallpapers/
    fi
	sleep 7200
done
