#!/bin/bash

clear

mkdir -vp ~/themes

sudo add-apt-repository ppa:tiheum/equinox
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/apps

sudo apt-get update

#install faenza icons
sudo apt-get install faenza-icon-theme dconf-cli

#install mac os lion theme and icons
sudo apt-get install mac-os-lion-icons-v2
sudo apt-get install mac-os-lion-theme-v2

#install mac cursors
wget -O mac-cursors.zip http://goo.gl/eYtho
sudo unzip mac-cursors.zip -d /usr/share/icons/; rm mac-cursors.zip
cd /usr/share/icons/mac-cursors
sudo chmod +x install-mac-cursors.sh uninstall-mac-cursors.sh
sudo ./install-mac-cursors.sh

#Mac spotlight-like search, synapse
sudo apt-get install indicator-synapse

# download solarized theme
git clone git://github.com/altercation/solarized.git ~/themes/solarized

#install solarized for gnome-terminal
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/themes/gnome-terminal-colors-solarized
cd ~/themes/gnome-terminal-colors-solarized
./install.sh

# terminator color scheme
git clone https://github.com/ghuntley/terminator-solarized.git ~/themes/terminator-solarized
mkdir -p ~/.config/terminator/
cp ~/themes/terminator-solarized/config ~/.config/terminator/

# download and install powerline fonts
git clone https://github.com/Lokaltog/powerline-fonts.git ~/themes/powerline-fonts
mkdir -pv ~/.fonts/
cp -r ~/themes/powerline-fonts/* ~/.fonts/
fc-cache -vf ~/.fonts
