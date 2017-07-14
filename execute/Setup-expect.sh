#!/bin/bash
###!/usr/bin/expect
set PASS = NKG
set USR = nkg-1f-6001
echo "Start install expect."
sudo apt-get update
sudo apt-get install expect


echo "Finish install expect."
echo "Start Copy File."
#cp ./flycapture2-2.11.3.121-amd64-pkg.tgz ~/Downloads
#cp ./LinuxLocalPredict.7z /home/$USER
#cd ~/Downloads
tar zxvf flycapture2-2.11.3.121-amd64-pkg.tgz
cd flycapture2-2.11.3.121-amd64
echo "Start install File."
#sudo rm /var/lib/apt/lists/lock
#sudo rm /var/cache/apt/archives/lock
#sudo rm /var/lib/dpkg/lock

expect <<EOF
spawn sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get install libraw1394-11 libgtkmm-2.4-1c2a \
libglademm-2.4-1c2a libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 libusb-1.0-0
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get install libglademm-2.4-1v5:i386
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get install libgtkmm-2.4-1v5
expect {
	"password for:" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get install libgtkmm-2.4-dev libgtkglextmm-x11-1.2-dev
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get -f install
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get install libglademm-2.4-1v5
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo apt-get -f install
expect {
	"password for" {send "NKG\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	eof
}
EOF

expect <<EOF
spawn sudo sh install_flycapture.sh
expect {
	"password for" {send "NKG\r";exp_continue}
	"install all the FlyCapture2 SDK packages?" {send "y\r";exp_continue}
	"Do you want to continue?" {send "y\r";exp_continue}
	"(y/n)" {send "y\r";exp_continue}
	"Enter the name of the user to add" {send "nkg-1f-6001\r";exp_continue}
	eof
}
EOF


echo "Finish install File."
echo "Finish Copy File."



















