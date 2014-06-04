#!/bin/bash

clear

# ======== adding necessary repositories ===============

#ubuntu tweak tool
sudo add-apt-repository ppa:tualatrix/ppa
#avant window navigator
#sudo add-apt-repository ppa:nilarimogard/webupd8


# ======== update repository list ==============
sudo apt-get update


# ======== installing programs ==================

sudo apt-get install vim
sudo apt-get install terminator
sudo apt-get install vlc
sudo apt-get install skype
sudo apt-get install ubuntu-tweak
#sudo apt-get install avant-window-navigator
sudo apt-get install wireshark

# install chrome
sudo apt-get install libxss1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# install zsh shell and copy shell settings
sudo apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/qiubix-settings/.zshrc ~/.zshrc
chsh -s /bin/zsh
cp ~/qiubix-settings/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
