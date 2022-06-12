

+  是从2017年开始接触Linux的，从《鸟哥的Linux私房菜》开始，开始自己装系统玩，然后成为Linux重度用户，再到shellscript写装机自动配置文件，再到阅读Linux内核的书籍，虽然看不太懂，也没动手写源码，只是写一些小的demo。
+ 每隔一段时间都会搜搜Linux上有哪些好玩的东西，一碰到好玩的就会折腾一整天，这次就是折腾窗口管理器。实际上，除了硬件不能动，Linux上一切都是可以折腾的，从界面到内核。
+ 从最开始的Ubuntu(Gnome桌面环境)，到有一次组会偶然听到我们的大师兄介绍他使用的Linux，他提到使用的窗口管理器为FVWM，请参见我的[FVWM配置](https://github.com/junjiecjj/configure_file/tree/master/fvwm)，因为我也一直不喜欢用Gnome和KDE等大型桌面环境，觉得会使得机器变慢，所以就折腾了FVWM，FVWM也是很高级的窗口管理器，非常节约内存，开机几百兆，但是它一般是用作浮动式的窗口管理器，很少用来做平铺式的窗口管理器，因为要想使用它作为平铺WM，配置会非常复杂。在折腾FVWM时就知道存在i3wm，dwm等平铺式WM，但是当时疲于它事，暂且没折腾。再使用了FVWM三年后，因为一次搬家，使用大屏显示器不方便，于是就想到用i3wm等，可以高效利用多窗口多工作空间的优势(FVWM也有这些概念)。



# 窗口、桌面、显示器

对于Windows用户，是不需要知道这些概念的，因为它是面向大众的。使用窗口管理器，在编写配置文件的时候，需要知道一些概念，否则不知道自己在配置什么、怎么配置。

+ 显示器是物理实体上的概念，一个显示器就是花钱买的屏幕。
+ 而开机后显示器上显示的全部内容就是一个桌面（也叫region，workspace），这一点windows用户所熟悉的，不管这个桌面上有没有打开应用，有没有图标，有没有状态栏。
+ 窗口就是桌面上打开的一个个应用，比如浏览器，word，软件等。

一个显示器可以有多个桌面，但是同时只能看到一个桌面的内容，显示器是桌面的承载，桌面是显示器的表现，在只有一个显示器的情况下，除了当聚焦的桌面是用户可以看到的，其他桌面是隐藏的。一个桌面内可以有多个窗口。

经过测试，一般两个显示器是最佳的，因为一个显示器过少，而超过两个，你会发现看不过来，而且切换鼠标的时候会很乱。

使用window的时候，一般用户只会使用一个桌面，并不会创建多个桌面（是可以创建的），如果只有一个屏幕，打开的应用比较多，窗口就会堆叠得很厉害，严重的影响效率和体验。

经上所述，用户不是真正的需要多个显示器，真正需要的是多个桌面，只是在需要的时候快速切换桌面。

而平铺式窗口管理器创建窗口的时候默认不会重叠，自动管理窗口布局。且可以自定义创建很多桌面，给每个桌面编号，取名，然后定义很多在窗口，桌面，显示器之间切换的快捷键，这些快捷键是很好记忆的，且人是有惰性的，使用一段时间后就适应了，因此十分高效。



# Tiling WM

先上效果图：

分别是Sepctrwm、i3、DWM、Awesome、Xmonad截图。



<font face="黑体" color=red size=5>Sepctrwm</font>

<img src="https://img-blog.csdnimg.cn/f8ba15d8aed64681992511d293ee5223.png" alt="Specrwm" style="zoom:67%;" />

<font face="黑体" color=red size=5>i3wm</font>
 <img src="https://img-blog.csdnimg.cn/0657d6c67dcd4ab0b634cd72b1b7a9ba.png" alt="I3WM" style="zoom:67%;" />



<font face="黑体" color=red size=5>DWM</font>

<img src="https://img-blog.csdnimg.cn/bd20c8fd46b04bd4b110d2bc2b1d59f1.png" alt="DWM" style="zoom: 67%;" /> 



<font face="黑体" color=red size=5>**Awesome**</font>

<img src="https://img-blog.csdnimg.cn/7a28c2d8947a4054be6bfca81e44c139.png" alt="img" style="zoom:67%;" /> 





<font face="黑体" color=red size=5>**Xmonad**</font>

<img src="https://img-blog.csdnimg.cn/87c482deda5f489d9893d7e907b168f3.png" alt="img" style="zoom:67%;" />




i3wm、DWM、Awesome、Xmond、Bspwm等都是Linux系统上的平铺式窗口管理器(Tiling Windows manager)，一般只有顶级用户才需要定制自己的窗口管理器，但对于喜欢折腾的人来说，也是很好的消遣方式。

有哪些平铺式WM：

[1. Top 15 Window Managers for Linux](https://www.fosslinux.com/49466/top-window-managers-for-linux.htm)

[2. What are the best window managers for Linux?](https://www.slant.co/topics/390/~best-window-managers-for-linux)

相比于集成了窗口管理器的Gnome、KDE等桌面环境来说，平铺式窗口管理器优点如下：

+ 节约内存和机器的CPU。一般Windows开机啥也不干，需要3G内存，Ubuntu开机啥也不干，需要2G，而平铺窗口管理器因为只需要开启的基本程序，只需要1G。

+ 高效。因为定义了很多在窗口、工作区、显示器之间切换的快捷键，可以很方便的快速切换，这一优点可以克服显示器少和屏幕小的缺点，使得一个笔记本就可以高效办公、Code等。

+ 界面美观。

+ 适合于热衷按照使用习惯、喜好定制化自己桌面，有较强掌控欲的用户。

+ 不需要鼠标或者最大程度的减少对鼠标的依赖。当只用neovim(类vim编辑器)、ST(终端)、ranger(终端文件管理器)、zathura(PDF阅读器)等类vim软件时，完全不需要鼠标就可以使用；但对于需要使用google-chrome、wps、VSCode、Spyder等或者其他专业领域的IDE的用户来说，当熟悉IDE快捷键时，也不需要鼠标，但是不熟悉IDE快捷键时还是需要鼠标会比较方便。

+ 可以定制状态栏，比如我的配置文件中就有I3block或者i3status两种状态栏，用的时候只需要选择一种即可，如下图我的i3blocks(配置文件为 **i3blocks.conf** )状态栏就依次显示：

  + 上下行网速
  + wifi名称，IP，信号强度
  + 天气，时间，日期
  + 内存情况，cpu使用率
  + 磁盘使用情况
  + 音量
  + 电量
  + CapsLock 和Numlock
  + 键盘背光调节
  + 键盘布局
  + 显示器管理
  + 剪切板
  + 音量控制系统托盘等

  

具体的快捷键和配置文件请看，**config** 和 **config.base** 文件，这两个配置文件一致，config是config.base生成的，只是多了配色设置，具体啥区别，请看 [j4-make-config](https://article.itxueyuan.com/wAbPE)的介绍。

其他WM，请看：

+ [DWM](https://github.com/junjiecjj/my-dwm) ： C语言实现，C配置文件
+ [I3WM](https://github.com/junjiecjj/i3)： C语言实现，文本语言配置
+ [Xmoad](https://github.com/junjiecjj/xmonad)：HaskShell实现，HaskShell配置
+ [Awesome](https://github.com/junjiecjj/awesome)： C语言实现，Lua配置
+ [BspWM](https://github.com/junjiecjj/bspwm)：C语言实现，文本语言配置
+ [LeftWM](https://github.com/junjiecjj/leftwm) ：Rust底层实现和Rust实现
+ [herbstluftwm](https://github.com/junjiecjj/herbstluftwm)：C++语言实现，文本语言配置
+ [spectrwm](https://github.com/junjiecjj/spectrwm)：C语言实现，文本语言配置

以上就是最常见的Tiling WM, 使用TilingWM最好是在Arch发行版的系统上，Linux发行版生态最好的是Arch系列的衍生版，我用Ubuntu20.04，Spectrwm的状态栏就无法很好的支持，有一个`bar_action_expand	= 1`特性就无法使用，设置这个值就会提示错误，而这个值对实现显示CPU，Mem，Net等状态栏信息至关重要，否则状态栏会很简单。

其中Bspwm的使用感受不太好，主要是不自带显示工作区的功能，而polybar，dze2，tin2等显示状态栏信息的工具需要单独配置，我的电脑编译安装polybar失败，所以状态栏无法显示。

而i3，DWM，Xmond，Awesome都有自带的状态栏，i3WM有i3blocks，显示的信息非常多，DWM可以编译安装slstatus，Xmonad有xmobar，但这三者都需要简单的配置，Awesome在状态栏方面可以说是佼佼者，几行代码搞定，可以自动检索CPU核数，显示每个CPU的负载，且自带非常完善的菜单栏，最接近KDE等桌面环境同时又具备非常完善的平铺功能，对新手非常友好。

个人感受：Awesome、i3是比较适合上手的，且拓展非常丰富。而xmonad、DWM的配置文件就是直接修改源码来，spectrwm是吸取了xmonad、DWM优点，底层是C语言，但配置文件是文本语言，非常容易配置。leftwm因为使用rust编写，速度快，bspwm不作评论，herbstluftwm有些官网的功能居然失效。

以上几种WM，对于平铺和浮动窗口的总结如下：

+ DWM：

  + Win+Shift+Space:桌面布局方式切换，但只在最近的两种模式中切换，默认为平铺和浮动，
  + Win+Space：当前窗口在浮动和平铺模式中切换，双向切换, 
  + 可以有多个浮动窗口.  
  + win+f全屏来回切换(只针对平铺窗口)。
  + win+j/k切换聚焦包括浮动窗口，也就是所有当前桌面的窗口间切换焦点。焦点跟随鼠标。
  
  + WIn+鼠标左键拖动:  将当前窗口变为浮动窗口且移动，剩下的窗口自动平铺。
  + win+鼠标右键拖动：将当前窗口变为浮动窗口且缩放大小，剩下的窗口自动平铺。
  
+ I3WM：

  + 只存在平铺(堆叠，标签模式，水平切割，垂直切割)和浮动模式，i3WM和其他WM不同支出就在于窗口的布局方式，以tabbed模式和浮动模式为主，平铺模式下模式和其他不同。

  + mod+Shift+space：将当前container(焦点窗口)在浮动和固定窗口间切换，双向切换, 
  + 可以有多个浮动窗口，
  + mod+space ：聚焦于上一个拥有焦点的浮动/平铺容器；
  + win+j/k只在浮动窗口或平铺窗口之间切换焦点，不会从平铺切换到浮动也不会从浮动切换到平铺。
  + 不支持WIN+鼠标左键将窗口变为浮动。
  + win+f全屏来回切换(针对平铺和浮动窗口)。
  + 焦点跟随鼠标。

+ Awesome:  

  + modkey+Shift+space：切换桌面布局，
  + modkey+Control+space：反向切换桌面布局，
  + modkey+ space：切换当前窗口是否为浮动,双向切换, 
  + 可以有多个浮动窗口，
  + win+j/k切换聚焦包括浮动窗口，也就是所有当前桌面的窗口间切换焦点。
  + 不支持WIN+鼠标左键将窗口变为浮动。但是支持Win+鼠标左键将移动窗口位置，且移动时鼠标位置相对固定，Win+鼠标右键改变平铺窗口大小。
  + win+f全屏来回切换(针对平铺和浮动窗口)。
  + 焦点跟随鼠标。

+ Xmonad：

  + (modMask.|. shiftMask,   xK_space)：遍历各种窗口布局，
  + (modMask .|. controlMask, xK_space)：将当前标签页窗口布局模式变为default，
  + (modMask, xK_space)：将浮动窗口重新变为平铺。
  + Mod+鼠标左键：将当前窗口变为浮动且移动；
  + 可以有多个浮动窗口，
  + win+j/k切换聚焦包括浮动窗口，也就是所有当前桌面的窗口间切换焦点。
  + win+f全屏来回切换(只针对平铺窗口)。
  + WIn+鼠标左键拖动:  将当前窗口变为浮动窗口且移动，且移动时鼠标位置相对固定，剩下的窗口自动平铺。
  + win+鼠标右键拖动：将当前窗口变为浮动窗口且缩放大小，剩下的窗口自动平铺。
  + 焦点跟随鼠标。

+ LeftWM：

  + modkey+Shift+space：切换桌面布局，
  + modkey+Control+space：反向切换桌面布局，
  + modkey+ space：切换当前窗口是否为浮动。和Awesome一样。
  + WIn+鼠标左键:将当前窗口变为浮动窗口且移动，剩下的窗口自动平铺。
  + win+鼠标右键：将当前窗口变为浮动窗口且缩放大小，剩下的窗口自动平铺。
  + win+j/k切换聚焦包括浮动窗口，也就是所有当前桌面的窗口间切换焦点。
  + 可以有多个浮动窗口，
  + win+f全屏来回切换(针对平铺和浮动窗口)。
  + 焦点跟随鼠标。

+ SpectrWM：

  + Win+Shift+Space:桌面布局方式依次切换；
  + MOD+space：切换当前窗口为浮动窗口和平铺窗口，双向；
  + WIn+鼠标左键拖动:将当前窗口变为浮动窗口且移动，剩下的窗口自动平铺。
  + 不支持win+鼠标右键拖动：将当前窗口变为浮动窗口且缩放大小，剩下的窗口自动平铺。
  + win+j/k切换聚焦包括浮动窗口，也就是所有当前桌面的窗口间切换焦点。
  + 可以有多个浮动窗口，
  + win+f全屏来回切换(针对平铺和浮动窗口)。
  + 焦点跟随鼠标。

+ herbstluftwm：

  + modkey+Shift+space：依次循环切换桌面布局，

  + modkey+ space：切换当前桌面窗口布局是否为浮动，全部浮动。
  + mod+f：当前窗口是否全屏，双向。不影响另外窗口的布局
  + mod+Alt+m：切换当前桌面窗口布局变为最大化，单向
  + mod+Alt+f：切换当前桌面窗口布局变为浮动，单向
  + mod+Alt+v：切换当前桌面窗口布局变为水平分割，单向
  + mod+Alt+h：切换当前桌面窗口布局变为垂直分割，单向
  + win+j/k切换聚焦。
  + 焦点跟随鼠标。

至于多显示器：

+ Awesome: 每个显示器都可以打开所有的桌面，显示器之间的桌面完全独立，也就是如果有7个桌面，则显示器1和2都可以有7个桌面，且在显示器1中切换桌面不会影响显示器2,系统托盘只在primary显示, 切换显示器只能通过win+ [ ] 切换。

  + [awesome](https://www.zhihu.com/search?q=awesome&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1771261986})的各个工作区是和屏幕分别绑定。假如你本身设置了9个工作区，那么双屏之后你可用的工作区数量是2*9=18，而不像i3那样两个屏幕共用9个工作区；同时两个屏幕上工作区的切换是解耦的，0号屏幕切换到1号工作区，1号屏幕并不会随之切换，DWM也是解耦的，其他的都不是解耦的。

+ Dwm: 每个显示器都可以打开所有的桌面，显示器之间完全独立，也就是如果有7个桌面，则显示器1和2都可以有7个桌面，且在显示器1中切换桌面不会影响显示器2,系统托盘只在primary显示，切换显示器只能通过win+ [ ] 切换。

  

+ I3WM:  并不是每个显示器可以显示所有的桌面，是全部显示器加起来显示全部的桌面，比如桌面1在显示器1，桌面2在显示器2，桌面3在显示器2，那桌面1不会在显示器2, 且如果当前在显示器1，显示桌面1，如果切换到桌面2，则会自动切换聚焦到桌面2。

  

+ Xmonad:  每个显示器都可以打开所有的桌面。如果有两个显示器，一个打开了三个桌面1、2、3，初始时显示器1显示桌面1，显示器2显示2，如果当前在显示器1，则显示器1上可以切换所有桌面，当显示1切换桌面2时，桌面2显示在显示器1，将桌面1显示在显示器2，即交换当前已经显示的桌面；如果切换到桌面3，则桌面3在显示器1显示，桌面2还是显示在显示器2。切换显示器只能通过win+ [ ] 切换。

  

+ LeftWM: 每个显示器都可以打开所有的桌面。如果有两个显示器，一个打开了三个桌面1、2、3，初始时显示器1显示桌面1，显示器2显示2，如果当前在显示器1，则显示器1上可以切换所有桌面，当显示1切换桌面2时，桌面2显示在显示器1，将桌面1显示在显示器2，即交换当前已经显示的桌面；如果切换到桌面3，则桌面3在显示器1显示，桌面2还是显示在显示器2。切换显示器只能通过win+ [ ] 切换。

+ SpectrWM：每个显示器都可以打开所有的桌面。比如两个显示器1、2，4个桌面1、2、3、4。当前状态为显示器1显示桌面1，显示器2显示桌面2，且聚焦在显示器1，则如果切换至桌面2，则自动切换聚焦到显示器2，如果切换到桌面3、4，则在当前显示器显示桌面3、4，也就是：如果需要切换到当前已经在显示器上显示的桌面，则切换到相应的显示器，否则如果需要切换的桌面没有被显示，则显示在当前显示器。状态栏在所有显示器上显示。

  







# i3WM安装与配置

# 安装i3wm

`sudo apt install i3`

配置文件为**config.base**，从头看到尾就知道需要安装什么，注释很详细。

因为追求节约机器的资源，很多软件不用默认的，需要安装轻量级的替代软件和一些后台服务软件，以下是需要安装的软件。其中网络，音量，redshift护眼工具，蓝牙等系统托盘是服务软件，可以可视化调节音量等，当然，配置文件中也定义了音量、亮度增减的快捷键。

## 安装 字体  例如apple的Yosemite San Francisco的ttf文件

> 1. 安装文泉驿微米黑字体

   ```bash
   sudo apt-get install fonts-wqy-microhei
   sudo apt-get install fonts-wqy-zenhei
   ```




> 2. 安装微软字体、宋体等

   ```bash
   sudo apt-get update
   sudo apt-get install ttf-mscorefonts-installer
   sudo fc-cache -f -v # 更新字体缓存
   ```



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

具体安装方法[请见](https://github.com/junjiecjj/MarkDown/blob/main/recordEverything.md)。




## 安装picom 

```bash
$: cd ~/tmp
$: sudo apt install cmake meson git pkg-config asciidoc libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
$: git clone https://github.com/jonaburg/picom.git
$: cd picom
$: git submodule update --init --recursive
$: meson --buildtype=release . build
$: LDFLAGS="-L/path/to/libraries" CPPFLAGS="-I/path/to/headers" meson --buildtype=release . build
$: ninja -C build
$: sudo ninja -C build install
$: cd
# 有时使用像 双河濑 你需要指定 – 实验后端 标志如下：
$: picom --config  ~/.config/picom/picom.conf --experimental-backends -b
$: picom --experimental-backends -b


$: sudo apt install compton xcompmgr


```





## 安装 i3-gaps

```bash
sudo add-apt-repository ppa:regolith-linux/release

sudo apt update

sudo apt install i3-gaps
```



##  安装polybar



```bash
$ sudo apt update
$ sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev
$ sudo apt install libxcb-composite0-dev
$ sudo apt install libjsoncpp-dev
$ sudo ln -s /usr/include/jsoncpp/json/ /usr/include/json

$ git clone https://github.com/jaagr/polybar.git

$ cd polybar && ./build.sh
//启动polybar
$ polybar example


或者
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
#系统托盘
sudo apt install  trayer  stalonetray


# 多显示器需要使用配置工具，我用的是 xrandr。其他工具还有 Xinerama 和 winView，另外 arandr 是 xrandr 的图形界面，也可以用。
sudo apt install  arandr  x11-xserver-utils

# Viewnior是一个图像查看器应用程序，它被创建为简单，快速且优雅。
sudo apt install viewnior

#PDF阅读zathura, 文件管理器pcmanfm,thunar
sudo apt install zathura  pcmanfm  thunar

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



## 声音控制系统托盘

```bash

# 第一种工具 ALSA, `alsamixer` 、 `amixer`
sudo apt install    alsa-utils   asmixer


# 第二种工具
sudo apt-get install pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
```







### Advanced Linux Sound Architecture (简体中文)

` sudo apt install pulseaudio    alsa-utils   asmixer`

https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

[高级 Linux 声音体系](https://en.wikipedia.org/wiki/zh:ALSA)（Advanced Linux Sound Architecture，**ALSA**）提供声卡的内核驱动，代替了原来的开放声音系统（Open Sound System，OSS）。

除了声音设备驱动，**ALSA**还捆绑了一个用户空间驱动的库用于应用开发。开发者可以使用这些 ALSA 驱动进行高级 API 开发，可以通过 ALSA 库达成与声音设备的内核（直接）交互。

[安装](https://wiki.archlinux.org/title/Help:Reading_(简体中文)#安装软件包) 软件包 [alsa-utils](https://archlinux.org/packages/?name=alsa-utils)。其包含 `alsamixer` 、 `amixer` 等实用程序。*amixer*是一个用于更改音频设置的shell命令，而*alsamixer*则提供了一个较为直观的，基于[ncurses](https://en.wikipedia.org/wiki/Ncurses)的界面，用于配置声音设备。

#### 解除各声道的静音

ALSA 默认静音所有声道，必须手动解除。

#### 使用amixer解除静音

可以使用 `amixer` 解除声卡的主音量静音：

```bash
$ amixer sset Master unmute
$ amixer sset Speaker unmute
$ amixer sset Headphone unmute
```

#### 使用alsamixer解除静音

使用 `alsamixer` 可以解除声卡的静音：

```bash
$ alsamixer
```

### PulseAudio (简体中文)

`sudo apt install pulseaudio  `

https://wiki.archlinux.org/title/PulseAudio_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

[PulseAudio](https://en.wikipedia.org/wiki/PulseAudio) 是在[GNOME](https://wiki.archlinux.org/title/GNOME) 或 [KDE](https://wiki.archlinux.org/title/KDE)等桌面环境中广泛使用的音频服务。它在内核音频组件（比如[ALSA](https://wiki.archlinux.org/title/ALSA) 和 [OSS](https://wiki.archlinux.org/title/OSS)）和应用程序之间充当代理的角色。由于Arch Linux默认包含ALSA，PulseAudio经常和ALSA协同使用。

#### 前端

有多种前端工具可以用以控制 PulseAudio 守护进程：

- GTK GUI：[paprefs](https://archlinux.org/packages/?name=paprefs) 和 [pavucontrol](https://archlinux.org/packages/?name=pavucontrol)
- 按键音量控制: [pulseaudio-ctl](https://aur.archlinux.org/packages/pulseaudio-ctl/)AUR，[pavolume-git](https://aur.archlinux.org/packages/pavolume-git/)AUR
- 控制台 (CLI)混合器：[ponymix](https://aur.archlinux.org/packages/ponymix/)AUR和[pamixer](https://archlinux.org/packages/?name=pamixer)
- 控制台 (curses) 混合器：[pulsemixer](https://archlinux.org/packages/?name=pulsemixer)
- 网页音量控制：[PaWebControl](https://github.com/Siot/PaWebControl)
- 系统托盘图标：[pasystray](https://archlinux.org/packages/?name=pasystray)，[pasystray-git](https://aur.archlinux.org/packages/pasystray-git/)AUR
- KF5 plasma 程序：[kmix](https://archlinux.org/packages/?name=kmix)和[plasma-pa](https://archlinux.org/packages/?name=plasma-pa)

#### 控制台

- **ncpamixer** — 受 pavucontrol 启发的用于 PulseAudio 的 Ncurses 混合器。

- **pacmixer** — PulseAudio 的 Alsamixer 近似。

- **PAmix** — 与 pavucontrol 相似的Ncurses PulseAudio 混合器。

- **pamixer** — PulseAudio CLI 混合器。

- **pavolume** — 带有 libnotify 消息的 PulseAudio 的简单 CLI 音量控制。

- **Ponymix** — PulseAudio 的 CLI 混合器。

- **pulseaudio-ctl** — 用 shell 或快捷键控制 PulseAudio。

- **pulsemixer** — PulseAudio 的 CLI 和 curses 混合器。



#### 图形界面

- **KMix** — [KDE](https://wiki.archlinux.org/title/KDE) 音量控制应用程序支持多个平台，包括 PulseAudio、可配置的系统托盘小程序。

- **MicTray** — 轻量级系统托盘应用程序，可让您使用 PulseAudio 控制麦克风状态和音量。

- **pa-applet** — 带有音量条的 PulseAudio 系统托盘小程序。

- **pasystray** — PulseAudio 的系统托盘小程序。

- **plasma-pa** — [KDE](https://wiki.archlinux.org/title/KDE) 使用 PulseAudio 进行音量管理的 Plasma 小程序

- **PulseAudio Equalizer** — 基于 LADSPA 的 PulseAudio 多频段均衡器。

- **PulseAudio Graph Control** — PulseAudio 图形化控制器

- **PulseAudio Manager** — PulseAudio 的简单 GTK 前端。 停止开发。

- **PulseAudio Preferences** — 简单的 PulseAudio GTK 配置对话框。

- **PulseAudio Volume Control** — 简单的 PulseAudio GTK 音量控制工具（“混音器”）。

- **PulseAudio Volume Control (Qt)** — PulseAudio 混音器（pavucontrol 的 Qt 端口）。

- **PulseAudio Volume Control (Sandsmark)** — LXQt 的 pavucontrol 轻量级分支，实现了 pavucontrol 的缺失功能，错误修复并删除非必要依赖。

- **PulseAudio Volume Meter** — 简单的 PulseAudio GTK 音量计。 停止开发。

- **PulseEffects** — PulseAudio的音频效果。

- **Volctl** — PulseAudio 的每个应用程序系统托盘小程序音量控制。

- **Xfce PulseAudio Panel Plugin** — [Xfce](https://wiki.archlinux.org/title/Xfce)4 面板的 PulseAudio 插件。



**我们着重关注的是系统托盘等功能：**

安装：

```bash
#============================================================================================
# pasystray: PulseAudio 的系统托盘小程序。
# KMix — KDE 音量控制应用程序支持多个平台，包括 PulseAudio、可配置的系统托盘小程序。
# 控制台 (curses) 混合器：pulsemixer
# GTK GUI：paprefs 和 pavucontrol
#============================================================================================
sudo apt install  paprefs pavucontrol  pulsemixer   pasystray  kmix
启动：  pasystray &
kmix &


#============================================================================================
#micty MicTray — 轻量级系统托盘应用程序，可让您使用 PulseAudio 控制麦克风状态和音量。
#============================================================================================
sudo add-apt-repository ppa:mictray/mictray
sudo apt-get update
sudo apt-get install mictray


启动：  mictray &

#============================================================================================
#pa-applet  pa-applet — 带有音量条的 PulseAudio 系统托盘小程序
#============================================================================================
git clone https://github.com/fernandotcl/pa-applet.git

cd pa-applet

$ ./autogen.sh

Compiling and installing it is simple enough:

$ ./configure --prefix=/foo/bar
$ make
$ make install

安装后启动：/foo/bar/bin/pa-applet &

#============================================================================================
#PulseAudio Graph Control：  — PulseAudio 图形化控制器
#============================================================================================
sudo apt install npm python
sudo npm install -g yarn

git clone https://github.com/futpib/pagraphcontrol.git
cd pagraphcontrol

yarn install
yarn build

启动：~/tmp/pagraphcontrol/dist/pagraphcontrol-linux-x64/pagraphcontrol

#To see audio peaks build papeaks and put it on your PATH.
cd ~/tmp

git clone https://github.com/futpib/papeaks.git

cd  papeaks

cargo build --release


#============================================================================================
#== Volctl — PulseAudio 的每个应用程序系统托盘小程序音量控制。
#============================================================================================
#https://buzz.github.io/volctl/ || volctlAUR
# https://github.com/buzz/volctl
git clone  https://github.com/buzz/volctl.git

cd volctl

 sudo cp data/apps.volctl.gschema.xml /usr/share/glib-2.0/schemas
 
 pip3 install setuptools
 
sudo apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev

 sudo apt install libgirepository1.0-dev
 
 
 python -m pip install pycairo
 
 sudo apt install libcairo2 python-cairo
 
 pip install pycairo
 
 


```



## 蓝牙系统托盘



[Bluetooth (简体中文)](https://wiki.archlinux.org/title/Bluetooth_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))



### 前端

#### 控制台

- **bluetoothctl** — Pairing a device from the shell is one of the simplest and most reliable options.



**提示：** 输入 `echo -e "<command1>\n<command2>\n" | bluetoothctl` 来自动化bluetoothctl命令

#### 图形界面

下面的软件包提供图形界面来设置蓝牙。

- GNOME Bluetooth-- GNOME的蓝牙工具。
  - [gnome-bluetooth](https://archlinux.org/packages/?name=gnome-bluetooth) 提供后端。
  - [gnome-shell](https://archlinux.org/packages/?name=gnome-shell) 提供状态托盘。
  - [gnome-control-center](https://archlinux.org/packages/?name=gnome-control-center) 可通过图形界面配置蓝牙。可以在活动预览输入“蓝牙”或者运行 `gnome-control-center bluetooth` 进行配置。
  - 你还可以直接运行 `bluetooth-sendto` 命令来把文件发送到远程设备。
  - 打开蓝牙设置面板来接收文件；只有在蓝牙设置面板打开时才能接收文件。
  - To add a Bluetooth entry to the *Send To* menu in Thunar's file properties menu, see instructions [here](https://docs.xfce.org/xfce/thunar/send-to). (The command that needs to be configured is `bluetooth-sendto %F`).

- **Bluedevil** — [KDE](https://wiki.archlinux.org/title/KDE)的蓝牙工具。如果Dolphin和系统托盘里没有蓝牙图标，就在系统托盘选项里启用，或者添加一个挂件。点击图标或在KDE系统设置里都可以配置蓝牙。

- [**Blueberry**](https://github.com/linuxmint/blueberry || [blueberry](https://archlinux.org/packages/?name=blueberry)) — Linux Mint的GNOME Bluetooth变种，可在所有桌面环境工作。*Blueberry* 不支持通过Obex Object推送来接收文件。

- **[Blueman](https://wiki.archlinux.org/title/Blueman)** — 全功能蓝牙管理器。https://github.com/blueman-project/blueman || [blueman](https://archlinux.org/packages/?name=blueman)

- **[ObexFTP](https://wiki.archlinux.org/title/ObexFTP)** — 在任意启动了OBEX的设备上传输文件的工具。





```bash
# blueberry系统托盘
sudo add-apt-repository ppa:trebelnik-stefina/cinnamon
sudo apt update
sudo apt install blueberry 



#Ubuntu 20.04 上安裝 Blueman 
sudo apt install blueman
sudo apt install bluez bluez-obexd
```

检查bluetooth service是否启动

```bash
sudo systemctl status bluetooth.service
```

若bluetooth.service没有启动，则启动它

```bash
sudo systemctl start bluetooth.service
```

系统托盘：

```bash
blueman-applet  &
```

就会发现任务栏上出现一个蓝牙的图标了





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

`sudo apt-get install  redshift  redshift-gtk`



##  Spotify是一个音乐流媒体服务商




```bash

sudo snap install spotify

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45


echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install spotify-client
