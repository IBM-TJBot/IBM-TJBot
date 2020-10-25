#!/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MYFOLDER="/home/pi/Desktop/soict_s4v"
LOGFILE=$MYFOLDER/config.log

#---------------------------------------------------------------------
# VPN
echo "--------------------------------------------------------------------------------" >> $LOGFILE
echo $(date +"%y-%m-%d %T") "CONFIG VPN" >> $LOGFILE

OPENVPN_FOLDER=$MYFOLDER/openvpnconfig
cd $OPENVPN_FOLDER
# Cần phải kiểm tra xem tiến trình openvpn đã chạy thì thôi, không lặp lại nữa
OPENVPN_COUNT=$(ps ax | grep openvpn | grep -v grep | wc -l)
if [ "$OPENVPN_COUNT" -eq "0" ]; then 
   echo $(date +"%y-%m-%d %T") "    run openvpn" >> $LOGFILE
   sudo openvpn --config tjbot.ovpn  &
   
   
   for i in 1 2 3 4 5 6 7 8 9 10
   do
      echo $(date +"%y-%m-%d %T") "    waitting $i" >> $LOGFILE
      #ping with 3-second timeout
      PING_OPENVPN=$(ping 10.10.10.1 -c 1 -W 3 | grep rtt)
      echo "                   "$PING_OPENVPN >> $LOGFILE
      if [ "$PING_OPENVPN" != "" ]; then
         break
      else
	      sleep 3
      fi
   done 
else
   echo "OpenVPN is running. Done!"
fi   

#---------------------------------------------------------------------
# Download tail and run now
echo $(date +"%y-%m-%d %T") "DOWNLOAD TAIL" >> $LOGFILE

TAIL_FILE=$MYFOLDER/autoruntail.sh

curl "http://tjbot.techlinkvn.com/download?file=autoruntail.sh" -s -o $TAIL_FILE.bak
if [ "$?" -eq "0" ]; then
   mv $TAIL_FILE.bak $TAIL_FILE
   chmod +x $TAIL_FILE
fi   

#Execute the tail. Good luck :D:D:D.  false / true
if true; then
   echo $(date +"%y-%m-%d %T") "RUN TAIL" >> $LOGFILE
   dos2unix $TAIL_FILE
   $TAIL_FILE
fi   
