#!/bin/bash

clear

sudo add-apt-repository ppa:pyside
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl

sudo apt-get update

# ====== dependencies installation ======
sudo apt-get install cmake cmake-curses-gui
sudo apt-get install libqt4-dev
sudo apt-get install libboost-dev
sudo apt-get install libopencv-dev
sudo apt-get install python3.2 python3-pyside
sudo apt-get install libpcl-all

# ====== DisCODe installation ====== 
git clone https://github.com/DisCODe/DisCODe.git ~/DisCODe
mkdir -p ~/DisCODe/build && cd ~/DisCODe/build
cmake .. -DCMAKE_INSTALL_PREFIX=`pwd`/inst && make && make install

# ====== DCL installation ====== 
mkdir -p ~/DCL

# CvBasic
git clone https://github.com/DisCODe/DCL_CvBasic.git ~/DCL/CvBasic
mkdir -p ~/DCL/CvBasic/build && cd ~/DCL/CvBasic/build
cmake .. && make -j4 && make install

# CvCoreTypes
git clone https://github.com/DisCODe/DCL_CvCoreTypes ~/DCL/CvCoreTypes
mkdir -p ~/DCL/CvCoreTypes/build && cd ~/DCL/CvCoreTypes/build
cmake .. && make -j4 && make install
