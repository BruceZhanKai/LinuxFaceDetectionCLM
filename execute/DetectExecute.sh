#!/bin/bash

PASS=ubuntu
LASER=/dev/ttyACM0
PROJECT=LocalFaceDetector

export MY_PATH0=./library/libDetection_so
export MY_PATH1=./library/libOpenCV
export MY_PATH2=./libQt
export MY_PATH4=./platforms
export MY_PATH3=./
export MY_PATH5=/usr/lib
export LD_LIBRARY_PATH="${MY_PATH0}:${MY_PATH1}:${MY_PATH2}:\
${MY_PATH3}:${MY_PATH4}:${MY_PATH5}:\
$LD_LIBRARY_PATH"

echo $LD_LIBRARY_PATH

cat /sys/module/usbcore/parameters/usbfs_memory_mb

ldd $PROJECT | grep "found"

expect <<EOF
spawn sudo chmod 777 $LASER
expect {
	"password for" {send "$PASS\r";exp_continue}
	eof
}
EOF

chmod 755 $PROJECT

echo "*** NTP Stop ***"
expect <<EOF
spawn sudo /etc/init.d/ntp stop
expect {
	"password for" {send "$PASS\r";exp_continue}
	eof
}
EOF
echo "*** NTP Correction ***"
expect <<EOF
spawn sudo ntpdate time.stdtime.gov.tw
expect {
	"password for" {send "$PASS\r";exp_continue}
	eof
}
EOF
echo "*** NTP Start ***"
expect <<EOF
spawn sudo /etc/init.d/ntp start
expect {
	"password for" {send "$PASS\r";exp_continue}
	eof
}
EOF

#cd $HOME/201708

while true
do 
	echo "*** Program Start ***"
	./$PROJECT
done
