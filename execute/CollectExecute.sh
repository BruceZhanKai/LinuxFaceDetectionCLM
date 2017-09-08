#!/bin/bash

PROJECT=LocalFaceCollector

export MY_PATH2=./libQt
export MY_PATH4=./platforms
export MY_PATH3=./
export LD_LIBRARY_PATH="${MY_PATH2}:${MY_PATH3}:${MY_PATH4}:$LD_LIBRARY_PATH"

cat /sys/module/usbcore/parameters/usbfs_memory_mb

ldd $PROJECT | grep "found"

chmod 755 $PROJECT

while true
do 
	echo "*** Program Start ***"
	./$PROJECT
done