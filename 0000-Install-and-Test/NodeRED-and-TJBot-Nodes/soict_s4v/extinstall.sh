#!/bin/bash
cd /home/pi/Desktop/
curl -O http://tjbot.techlinkvn.com/soict_s4v.zip
unzip ./soict_s4v.zip
chmod +x ./soict_s4v/autorun.sh
chmod +x ./soict_s4v/autoruntail.sh
chmod +x ./soict_s4v/myconfig.sh
rm ./soict_s4v.zip
sudo apt-get install dos2unix
sudo apt-get install openvpn
sudo raspi-config
crontab -e

mkdir /home/pi/Desktop/node-red/
touch /home/pi/Desktop/soict_s4v/tests/.env 
ln -s /home/pi/Desktop/soict_s4v/tests/.env /home/pi/Desktop/tjbot/bootstrap/tests/.env
ln -s /home/pi/Desktop/soict_s4v/tests/.env /home/pi/Desktop/labs/.env
ln -s /home/pi/Desktop/soict_s4v/tests/.env /home/pi/Desktop/node-red/.env
ln -s /home/pi/Desktop/soict_s4v/tests/.env /home/pi/.node-red/.env 