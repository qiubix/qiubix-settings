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

sudo apt-get install terminator
sudo apt-get install vlc
sudo apt-get install skype
sudo apt-get install ubuntu-tweak
#sudo apt-get install avant-window-navigator
sudo apt-get install wireshark
