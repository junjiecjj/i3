#! /usr/bin/env bash
#########################################################################
# File Name: time.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月12日 星期四 23时13分26秒

# 此程序的功能是：
#########################################################################


# ~/.config/polybar/script/time.sh脚本内容
weeknum=$(date +'%u')
weekday="-"
case "$weeknum" in
    "1")
    ┆  weekday="一"
    ┆  ;;
    "2")
    ┆   weekday="二"
    ┆   ;;
    "3")
    ┆   weekday="三"
    ┆   ;;
    "4")
    ┆   weekday="四"
    ┆   ;;
    "5")
    ┆   weekday="五"
    ┆   ;;
    "6")
    ┆   weekday="六"
    ┆   ;;
    "7")
    ┆   weekday="日"
    ┆   ;;
    *)
    ┆   ;;
esac
echo "$(date +'%m-%d %H:%M') 周$weekday"
