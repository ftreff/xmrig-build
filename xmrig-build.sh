#!/bin/bash
echo "This scrip will download and build xmrig and xmrig-mo.

read -p "Do you want to proceed with installing this service? (y/n) " yn

case $yn in 
	y ) echo ok, we will proceed;;
	n ) echo exiting...;
		sleep 1
		exit;;
	* ) echo invalid response;
		sleep 1
		exit 1;;
esac

echo "Downloading xmrig-mo"
sleep .2
git clone https://github.com/MoneroOcean/xmrig.git:xmrig-mo
sleep .2
echo "Downloading xmrig"
sleep .2
git clone https://github.com/xmrig/xmrig.git
sleep .2
echo "Downloading needed packages to proceed"
sleep .2
yes | sudo apt update
yes | sudo apt upgrade
yes | sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
sleep .2
echo "Building xmrig"
sleep .2
cd xmrig && mkdir build && cd build && cmake .. && sudo make
sleep .2
echo "Building xmrig-mo
sleep .2
cd && cd xmrig-mo && mkdir build && cd build && cmake .. && sudo make
sleep .2
echo "xmrig and xmrig-mo are now ready for use"
sleep 1

