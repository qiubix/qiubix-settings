#!/bin/bash

clear

# ======== adding necessary repositories ===============
# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# ubuntu tweak tool - no longer needed in 16.04 LTS (?)
# sudo add-apt-repository ppa:tualatrix/ppa

# albert launcher
sudo add-apt-repository ppa:nilarimogard/webupd8

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# ======== update repository list ==============
sudo apt update

# ======== installing programs ==================
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

sudo apt install docker-ce

sudo apt install -y vlc ubuntu-tweak gnome-tweak-tool tmux

# ======== installing useful tools ==================
# tree - directory browser
# 7zip - for archives
# ncdu - analyze disk usage
# gufw - firewall
# albert - awesome launcher
# plank - MacOS-like dock
sudo apt install -y tree p7zip-full p7zip-rar ncdu gufw albert plank

# install chrome
#sudo apt install libxss1 google-chrome-stable
sudo apt install chromium-browser

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome*.deb
# sudo apt-get install google-chrome-stable

# install spotify
# sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
# sudo apt-get update
sudo apt install spotify-client

echo "Done. Remember to configure firewall settings."
