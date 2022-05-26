#!/usr/bin/env bash


export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"



results=$(ps ax|grep -v grep|grep nm-applet)
# echo  $results
if [ "${results}" == "" ];then
    nm-applet &
else
    echo  ""
fi


results=$(ps ax|grep -v grep|grep   xscreensaver)
# echo  $results
if [ "${results}" == "" ];then
    xscreensaver -no-splash &
else
    echo  ""
fi




results=$(ps ax|grep -v grep|grep  redshift)
# echo  $results
if [ "${results}" == "" ];then
    redshift-gtk &
else
    echo  ""
fi



results=$(ps ax|grep -v grep|grep  picom)
# echo  $results
if [ "${results}" == "" ];then
    picom --experimental-backends -b
else
    echo  ""
fi




results=$(ps ax|grep -v grep|grep  flameshot)
# echo  $results
if [ "${results}" == "" ];then
    nohup flameshot >/dev/null 2>&1  &
else
    echo  ""
fi





results=$(ps ax|grep -v grep|grep  dunst)
# echo  $results
if [ "${results}" == "" ];then
    dunst &
else
    echo  ""
fi



results=$(ps ax|grep -v grep|grep  copyq)
# echo  $results
if [ "${results}" == "" ];then
    copyq  &
else
    echo  ""
fi



results=$(ps ax|grep -v grep|grep  numlockx)
# echo  $results
if [ "${results}" == "" ];then
    numlockx on
else
    echo  ""
fi



results=$(ps ax|grep -v grep|grep  fcitx)
# echo  $results
if [ "${results}" == "" ];then
    fcitx &
    fcitx5 &
else
    echo  ""
fi


results=$(ps ax|grep -v grep|grep pasystray)
# echo  $results
if [ "${results}" == "" ];then
    nohup   pasystray     >  /dev/null  2>&1 &
else
    echo  ""
fi





results=$(ps ax|grep -v grep|grep  kmix)
# echo  $results
if [ "${results}" == "" ];then
    nohup   kmix     >  /dev/null  2>&1 &
else
    echo  ""
fi


results=$(ps ax|grep -v grep|grep  pa-applet)
# echo  $results
if [ "${results}" == "" ];then
    nohup   /foo/bar/bin/pa-applet       >  /dev/null  2>&1 &
else
    echo  ""
fi


results=$(ps ax|grep -v grep|grep mictray)
# echo  $results
if [ "${results}" == "" ];then
    nohup   mictray       >  /dev/null  2>&1 &
else
    echo  ""
fi

results=$(ps ax|grep -v grep|grep   xautolock)
# echo  $results
if [ "${results}" == "" ];then
    xautolock -time 5 -locker '/usr/bin/betterlockscreen -l' -corners ---- -cornersize 30 &
    betterlockscreen -w dim
else
    echo  ""
fi











