#!/bin/bash
echo "This scrip will download and build xmrig and xmrig-mo."

read -p "Do you want to proceed with downloading and building the latest version xmrig and the xmrig monero ocean fork from GitHub? (y/n) " yn

case $yn in 
	y ) echo ok, we will proceed;;
	n ) echo exiting...;
		sleep 1
		exit;;
	* ) echo invalid response;
		sleep 1
		exit 1;;
esac

cd
echo "Downloading xmrig"
sleep .2
git clone https://github.com/xmrig/xmrig.git
sleep .2
echo "Downloading xmrig-mo"
sleep .2
cd
git clone https://github.com/MoneroOcean/xmrig.git xmrig-mo
sleep .2
echo "Downloading needed packages to proceed"
sleep .2
yes | sudo apt update
yes | sudo apt full-upgrade
yes | sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
yes | sudo apt autoremove
sleep .2
echo "Building xmrig"
sleep .2
cd && cd xmrig && mkdir build && cd build && cmake .. && sudo make
sleep .2
echo "Building xmrig-mo"
sleep .2
cd && cd xmrig-mo && mkdir build && cd build && cmake .. && sudo make
sleep .2
echo "xmrig and xmrig-mo are now ready for use"
sleep 1

