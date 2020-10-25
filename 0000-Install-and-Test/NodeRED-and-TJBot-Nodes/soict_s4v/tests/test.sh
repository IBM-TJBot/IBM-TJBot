#!/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MYFOLDER="/home/pi/Desktop/soict_s4v"
LOGFILE=$MYFOLDER/config.log
#-------------------------------------------------------------------------------------
#  Thực hiện việc kiểm tra bằng commandline, không thông qua nodejs
#-------------------------------------------------------------------------------------
cd $MYFOLDER/tests/
aplay ./chao.wav
raspistill --output /tmp/testsh.jpg   --quality 80 --encoding jpg
