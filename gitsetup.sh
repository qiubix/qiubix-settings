#!/bin/bash

#installing and setting up git

sudo apt-get update
sudo apt-get install git
sudo apt-get install git-core
sudo apt-get install xclip

git config --global user.name qiubix
git config --global user.email qiubix@gmail.com
git config --global github.user qiubix
git config --global push.default matching
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.ui true
git config --global branch.autosetuprebase always
git config --global merge.tool kdiff3

#ssh-keygen -t rsa -C "qiubix@gmail.com"
#cd ~/.ssh
#ssh-add id_rsa
#xclip -sel clip < ~/.ssh/id_rsa.pub
