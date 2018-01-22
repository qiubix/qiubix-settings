#!/bin/bash

clear

mkdir -vp ~/.themes

# sudo add-apt-repository ppa:tiheum/equinox
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/apps
sudo add-apt-repository ppa:noobslab/macbuntu

sudo apt-get update

sudo apt install dconf-cli

#install faenza icons
#sudo apt-get install -y faenza-icon-theme dconf-cli

#install mac os lion theme and icons
sudo apt install -y macbuntu-os-ithemes-lts-v7 macbuntu-os-icons-lts-v7

#Mac spotlight-like search, synapse
# sudo apt-get install -y indicator-synapse

# download solarized theme
git clone git://github.com/altercation/solarized.git ~/.themes/solarized

# download and install powerline fonts
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.themes/powerline-fonts
mkdir -pv ~/.fonts/
cp -r ~/.themes/powerline-fonts/* ~/.fonts/
fc-cache -vf ~/.fonts

#install solarized for gnome-terminal
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/.themes/gnome-terminal-colors-solarized
cd ~/.themes/gnome-terminal-colors-solarized
./install.sh

git clone https://github.com/B00merang-Project/macOS-Sierra-Dark.git ~/.themes/macOS-Sierra
xfconf-query -c xsettings -p /Net/ThemeName -s "macOS Sierra"

# terminator color scheme
# git clone https://github.com/ghuntley/terminator-solarized.git ~/themes/terminator-solarized
# mkdir -p ~/.config/terminator/
# cp ~/themes/terminator-solarized/config ~/.config/terminator/

# conky
# cd && wget -O .start-conky http://drive.noobslab.com/data/conky/start-conky
# chmod +x .start-conky

# conky-two theme
# cd && wget -O two-noobslab-wu.zip http://drive.noobslab.com/data/conky/two/conky-two-wlan-u.zip
# unzip two-noobslab-wu.zip && rm two-noobslab-wu.zip
