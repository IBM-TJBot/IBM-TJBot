#!/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MYFOLDER="/home/pi/Desktop/soict_s4v"
LOGFILE=$MYFOLDER/config.log

#---------------------------------------------------------------------
#Set local timezone
TZ='Asia/Ho_Chi_Minh'; export TZ

#---------------------------------------------------------------------
#Static IP if Dev Kit cannot connect to internet
CHECK_INTERNET=$(ping 8.8.8.8 -c 1 -W 3 | grep rtt)
echo $(date +"%y-%m-%d %T") 'TRY TO CONNECT INTERNET' >> $LOGFILE
echo "                   "$CHECK_INTERNET >> $LOGFILE
if [ "$CHECK_INTERNET" == "" ]; then
    echo $(date +"%y-%m-%d %T") "     set static IP for eth0" >> $LOGFILE 
    sudo ifconfig eth0 192.192.192.192 netmask 255.255.255.0
    sleep 1

   for i in 1 2 3 4 5 
   do
        #Must restart service after changing the interface
        echo "                   restart sshd" >> $LOGFILE
        sudo service ssh restart
        sleep 1
        PORTLIST=$(netstat -an -t | grep 22)
        echo "                   after restart"$PORTLIST >> $LOGFILE    
        if (( $(echo $PORTLIST | wc -l ) > 0 )); then
            break
        else
            sleep 2
        fi
   done     
fi


#---------------------------------------------------------------------
# Send infor
echo $(date +"%y-%m-%d %T") 'INFORM SERVER' >> $LOGFILE

VALUE=$(cat $MYFOLDER/id.txt)
INFO0='"id":"'$VALUE'"'

VALUE=$(hostname)
INFO1='"hostname":"'$VALUE'"'

VALUE=$(ifconfig eth0 | head -n2 | tail -n1 | awk '{print $2}')
INFO2='"eth0":"'$VALUE'"'

VALUE=$(ifconfig wlan0 | head -n2 | tail -n1 | awk '{print $2}')
INFO3='"wlan0":"'$VALUE'"'
    
VALUE=$(ifconfig tun0 | head -n2 | tail -n1 | awk '{print $2}')
INFO4='"tun0":"'$VALUE'"'

VALUE=$(udevadm info -n /dev/mmcblk0p1 | grep SERIAL | awk '{print $2}')
INFO5='"sdcard":"'$VALUE'"'

JSON='{'$INFO0,$INFO1,$INFO2,$INFO3,$INFO4,$INFO5'}'

echo $(date +"%y-%m-%d %T")"        "$JSON >> $LOGFILE
curl -X POST -H "Content-Type: application/json" -d $JSON http://tjbot.techlinkvn.com/inform
echo

#---------------------------------------------------------------------
#BLUETOOTH
sudo service bluetooth start
sleep 1

#---------------------------------------------------------------------
# Extract lab
echo $(date +"%y-%m-%d %T") "DOWNLOAD LABS" >> $LOGFILE

LAB_FILE=$MYFOLDER/labs.zip

curl 'http://tjbot.techlinkvn.com/download?file=labs.zip' -s -o $LAB_FILE
if [ "$?" -eq "0" ]; then
    echo $(date +"%y-%m-%d %T") '      unzip lab folder' >> $LOGFILE
    unzip -o $LAB_FILE -d  /home/pi/Desktop/
    rm  $LAB_FILE
fi   

#---------------------------------------------------------------------
#DEV
sudo service node-red start

#---------------------------------------------------------------------
# TEST
MYTESTFOLDER="/home/pi/Desktop/soict_s4v/tests"
sudo $MYTESTFOLDER/ws2811_1led -t 0x330000
sleep 1
sudo $MYTESTFOLDER/ws2811_1led -t 0x007700
sleep 1
sudo $MYTESTFOLDER/ws2811_1led -t 0x0000CC
sleep 1
sudo $MYTESTFOLDER/ws2811_1led -t 0xFFFFFF
sleep 1
sudo $MYTESTFOLDER/ws2811_1led -t 0x000000

echo $(date +"%y-%m-%d %T") "RUN TEST" >> $LOGFILE
#Testing by OS commandline or by nodejs instructions.   false / true
if false; then
    #Servo
    sudo nodejs $MYTESTFOLDER/test.root .js
    #Audio, Camera
    nodejs $MYTESTFOLDER/test.pi.js    
else    
    #Led
    sudo $MYTESTFOLDER/

    #Audio
    aplay $MYTESTFOLDER/chao.wav
    #Mic
    arecord -d 3 -c 1 /tmp/test_recording.wav
    sleep 1
    aplay /tmp/test_recording.wav

    #Camera
    rm /tmp/test_camera.jpg
    raspistill --output /tmp/test_camera.jpg   --quality 50 --encoding jpg
    jp2a /tmp/test_camera.jpg --color -b
fi
