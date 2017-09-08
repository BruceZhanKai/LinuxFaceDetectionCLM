# LinuxLocalPorting

## Ubuntu 16.04

### Foce UEFI Installation -> [back]

### 修復 GRUB（PATA=hda、SATA/SCSI/SAS=sda）

```
$ sudo update-grub
$ sudo grub-install /dev/sda
```

### 修復 出現 "grub rescue>" (進不了Linux桌面時)

```
grub rescue > set boot=(hd0,6)
grub rescue > set prefix=(hd0,6)/grub
grub rescue > insmod normal
grub rescue > normal
```

### login usb-ubuntu system

```
$ sudo fdisk -l
$ sudo mount /dev/sda6 /mnt
$ sudo grub-install --root-directory=/mnt /dev/sda
```
reboot and change boot setting first sata
 
 
### 進入Linux Install Dependencies

 ```
$ sudo apt-get update
$ sudo apt-get install -y build-essential
$ sudo apt-get install -y cmake
$ sudo apt install cmake-curses-gui
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade

$ sudo add-apt-repository ppa:notepadqq-team/notepadqq
$ sudo apt-get update
$ sudo apt-get install notepadqq
```

### ntp

```
$ sudo apt-get install ntp ntpdate
$ sudo gedit /etc/ntp.conf
```

> add
> "server time.stdtime.gov.tw"
> "server tick.stdtime.gov.tw"
> "server tock.stdtime.gov.tw"

```
$ sudo /etc/init.d/ntp stop
$ sudo ntpdate tick.stdtime.gov.tw
$ sudo /etc/init.d/ntp start
```

it do not work in one pc with two operating systems

the way to solve it is that turn on UTC in windows or turn off UTC in ubuntu

turn off UTC in ubuntu

1. ubuntu 14.04

```
$ sudo gedit /etc/default/rcS
# from "UTC=yes" to "UTC=no"
```

2. ubuntu 16.04

```
$ timedatectl set-local-rtc 1
```

then do time correction by BIOS or windows system
as set date manually and lock with bios
```
$ date 09041005 #9/4 10:05
$ sudo hwclock --systohc --localtime
```

### ssh + tmux from SERVER to CLIENT

1. in SERVER
```
$ sudo apt-get install openssh-server
```

2. in CLIENT
```
$ sudo apt-get install openssh-server
$ sudo apt-get install tmux
```

fix DISPLAY from 10.0 to 0.0

```
$ export DISPLAY=:0.0
```

create new branch

```
$ tmux
```

execute your program
```
$ cd 20170828_LocalDetect
$ ./Execute.sh
```
detach from tmux
```
$ ctrl + b then d
```
reattach tmux
```
$ tmux attach
```
delete tmux
```
$ ctrl + b then &
```
exit ssh 
```
$ enter then ~.
```

## Dlib

Download [dlib-18.18](https://sourceforge.net/projects/dclib/files/dlib/v18.18/)

put "dlib-18.18" file to "$HOME/"

```
$ cd dlib-18.18/dlib
$ mkdir build
$ cd build
$ cmake ..
$ make
$ sudo make install
$ sudo ldconfig
```

## TBB
```
$ sudo apt-get install libtbb.dev
$ sudo apt-get install libboost-dev libboost-thread-dev libboost-system-dev libboost-filesystem-dev
```


## QT

 Download [SDK 5.8](https://wiki.qt.io/Install_Qt_5_on_Ubuntu)


_______________________________________________________________________________________________

## OpenCV


Download opencv-2.4.13-linux

```
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.13/opencv-2.4.13.zip
$ sudo apt-get install build-essential
$ sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
$ sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
$ unzip opencv-2.4.13.zip
$ cd opencv-2.4.13
$ mkdir release
$ cd release
$ cmake cmake -G "Unix Makefiles" -DCMAKE_CXX_COMPILER=/usr/bin/g++ CMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_TBB=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_V4L=ON -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON -DWITH_OPENGL=ON -DBUILD_FAT_JAVA_LIB=ON -DINSTALL_TO_MANGLED_PATHS=ON -DINSTALL_CREATE_DISTRIB=ON -DINSTALL_TESTS=ON -DENABLE_FAST_MATH=ON -DWITH_IMAGEIO=ON -DBUILD_SHARED_LIBS=OFF -DWITH_GSTREAMER=ON ..
$ cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DWITH_TBB=ON -DINSTALL_C_EXAMPLES=ON -DINSTALL_TESTS=ON -DBUILD_TBB=ON ..
$ make all -j4
$ sudo make install
```

## FlyCapture2


### ubuntu 14.04

Download [FlyCapture SDK](https://www.ptgrey.com/downloads)

Choose FlyCapture 2.9.3.15 SDK - ARMHF (32-bit) — 03/29/2016 - 17.1206MB (flycapture2-2.9.3.43-amd64-pkg)

```
$ tar zxvf flycapture2-2.9.3.43-amd64-pkg.tgz
$ cd flycapture2-2.9.3.43-amd64-pkg.tgz
$ sudo apt-get install libraw1394-11 libgtkmm-2.4-1c2a libglademm-2.4-1c2a libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 libusb-1.0-0
$ sudo sh install_flycapture.sh
```
Would you like to continue and install all the FlyCapture2 SDK packages?
(y/n)$ y
If this is not ran then your cameras may be only accessible by running flycap as sudo.
(y/n)$ y
Enter the name of the user to add to this user group.
$ ubuntu
Is this user name ok?: ubuntu
(y/n)$ y
Add user ubuntu to group pgrimaging.
Is this ok?:
(y/n)$ y
Do you want to restart the udev daemon?
(y/n)$ y

run /usr/bin/Flycap2 to test
if could not detect camera, just reboot

```
$ cd /usr/bin/
$ ./Flycap2
```

### ubuntu 16.04

Download [FlyCapture SDK](https://www.ptgrey.com/downloads)

Choose flycapture2-2.11.3.121-amd64-pkg

```
$ tar zxvf flycapture2-2.11.3.121-amd64-pkg.tgz
$ cd flycapture2-2.11.3.121-amd64
$ sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
$ sudo apt-get install libraw1394-11 libgtkmm-2.4-1c2a \
  libglademm-2.4-1c2a libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 libusb-1.0-0
$ sudo apt-get install libglademm-2.4-1v5:i386
$ sudo apt-get install libgtkmm-2.4-1v5
$ sudo apt-get install libgtkmm-2.4-dev libgtkglextmm-x11-1.2-dev
$ sudo apt-get -f install
$ sudo apt-get install libglademm-2.4-1v5
$ sudo apt-get -f install
$ sudo sh install_flycapture.sh
```
run /usr/bin/Flycap2 to test
if could not detect camera, just reboot

```
$ cd /usr/bin/
$ ./Flycap2
```

## CLM

add folder "CLM_src" in 1st floor folder and put all cpp & hpp files in
move main cpp to 1st floor folder
move "model" to 1st floor folder

