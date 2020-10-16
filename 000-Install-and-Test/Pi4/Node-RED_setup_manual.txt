Setting up Nodered Running on Raspberry Pi(tjbot)

Reference:
https://learn.sparkfun.com/tutorials/getting-started-with-tjbot/all
https://nodered.org/docs/getting-started/raspberrypi
https://medium.com/@jeancarlbisson/setting-up-your-tjbot-to-use-node-red-df94ff94a114
https://github.com/jeancarl/node-red-contrib-tjbot

Prerequisites
If you are using Raspbian, then you must have Raspbian Jessie as a minimum version. Raspbian Buster is the currently supported version.
Hardware: Pi3/Pi4

==========================================
Installing and Upgrading Node-RED
==========================================
$ bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)



==========================================
Autostart on boot
==========================================
$ sudo systemctl enable nodered.service



==========================================
Install TJbot Node-Red Nodes
==========================================
$ cd ~
$ cd .node-red
$ mkdir nodes
$ cd nodes
$ git clone https://github.com/jeancarl/node-red-contrib-tjbot
cd node-red-contrib-tjbot/
npm install

if error happened, downgrade npm to version 10.22.1
$ sudo npm install -g n
$ sudo n 10.22.1

$ sudo vi /lib/systemd/system/nodered.service
change User:pi  -> User:root

$ sudo systemctl daemon-reload
$ node-red-start
$ node-red-stop

$ sudo vi /root/.node-red/settings.js
change 
userDir: '/home/nol/.node-red -> userDir: '/home/pi/.node-red
nodesDir: '/home/nol/.node-red -> nodesDir: '/home/pi/.node-red

$ node-red-start

==========================================
Testing
==========================================
If Pi has HDMI display, 
	- open brower and type: http://127.0.0.1:1880
If user want access Pi from other client PC
	- open brower and type: http://[raspberrypi_ip_addres]:1880

Create simple flow
Train TJBot to Wave in Node-RED
https://www.youtube.com/watch?v=uE8pvLttipU&list=PLddOPkVMz1dtN3I_4JKava4GBLLXuUevV&index=5

More
https://medium.com/@jeancarlbisson/how-to-train-your-tjbot-in-node-red-88bfb3bbe0ab