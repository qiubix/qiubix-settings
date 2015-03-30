#!/bin/bash

sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl

sudo apt-get update

# ====== dependencies installation ======
echo "Installing dependencies..."
sudo apt-get install cmake cmake-curses-gui libqt4-dev libboost-dev libboost-program-options-dev libboost-filesystem-dev libboost-program-options-dev libboost-iostreams-dev libboost-regex-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev libboost-timer-dev libopencv-dev python3 python3-pyside libpcl-all

# ====== DisCODe installation ======
echo "Installing DisCODe..."
git clone https://github.com/DisCODe/DisCODe.git $HOME/src/DisCODe
mkdir -p $HOME/src/DisCODe/build && cd $HOME/src/DisCODe/build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/bin/DisCODe && make && make install

# ====== DCL installation ======
echo "Setting up basic DCL..."
mkdir -p $HOME/src/DCL

# CvCoreTypes
git clone https://github.com/DisCODe/CvCoreTypes $HOME/src/DCL/CvCoreTypes
mkdir -p $HOME/src/DCL/CvCoreTypes/build && cd $HOME/src/DCL/CvCoreTypes/build
cmake .. && make -j4 && make install

# CvBasic
git clone https://github.com/DisCODe/DCL_CvBasic.git $HOME/src/DCL/CvBasic
mkdir -p $HOME/src/DCL/CvBasic/build && cd $HOME/src/DCL/CvBasic/build
cmake .. && make -j4 && make install
