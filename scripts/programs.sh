#!/bin/bash

clear

# ======== adding necessary repositories ===============

#ubuntu tweak tool
sudo add-apt-repository ppa:tualatrix/ppa

sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 

# ======== update repository list ==============
sudo apt-get update


# ======== installing programs ==================

sudo apt-get install vim
sudo apt-get install terminator
sudo apt-get install vlc
sudo apt-get install skype
sudo apt-get install ubuntu-tweak
sudo apt-get install wireshark

# ======== installing useful tools ==================
sudo apt-get install tree p7zip-full p7zip-rar 

# install chrome
sudo apt-get install libxss1
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome*.deb
sudo apt-get install google-chrome-stable

# install zsh shell and copy shell settings
sudo apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/qiubix-settings/.zshrc ~/.zshrc
chsh -s /bin/zsh
cp ~/qiubix-settings/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/

# install spotify
sudo apt-get install spotify-client
