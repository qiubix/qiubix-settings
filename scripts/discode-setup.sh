#!/bin/bash

clear

sudo add-apt-repository ppa:pyside
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl

sudo apt-get update

# ====== dependencies installation ======
echo "Installing dependencies..."
sudo apt-get install cmake cmake-curses-gui libqt4-dev libboost-dev libopencv-dev python3.2 python3-pyside libpcl-all

# ====== DisCODe installation ======
echo "Installing DisCODe..."
git clone https://github.com/DisCODe/DisCODe.git $HOME/src/DisCODe
mkdir -p $HOME/src/DisCODe/build && cd $HOME/src/DisCODe/build
cmake .. -DCMAKE_INSTALL_PREFIX=`pwd`/inst && make && make install

# ====== DCL installation ======
echo "Setting up basic DCL..."
mkdir -p $HOME/src/DCL

# CvBasic
git clone https://github.com/DisCODe/DCL_CvBasic.git $HOME/src/DCL/CvBasic
mkdir -p $HOME/src/DCL/CvBasic/build && cd $HOME/src/DCL/CvBasic/build
cmake .. && make -j4 && make install

# CvCoreTypes
git clone https://github.com/DisCODe/DCL_CvCoreTypes $HOME/src/DCL/CvCoreTypes
mkdir -p $HOME/src/DCL/CvCoreTypes/build && cd $HOME/src/DCL/CvCoreTypes/build
cmake .. && make -j4 && make install
