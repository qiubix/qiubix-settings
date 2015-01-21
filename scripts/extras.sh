#!/bin/bash

clear
echo "Installing extra tools..."

sudo add-apt-repository ppa:cairo-dock-team/ppa

sudo apt-get update

sudo apt-get install gconf-editor
sudo apt-get install cairo-dock cairo-dock-plugins
sudo apt-get install flashplugin-installer ubuntu-restricted-extras
sudo apt-get install compizconfig-settings-manager
sudo apt-get install conky curl lm-sensors hddtemp
sudo apt-get install wireshark
