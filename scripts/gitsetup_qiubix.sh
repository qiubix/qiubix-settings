#!/bin/bash

#installing and setting up git

sudo apt-get update
sudo apt-get install git git-core xclip gitk gitg

ln -s ~/qiubix-settings/.gitignore_global ~/.gitignore_global

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
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore_global

ssh-keygen -t rsa -C "qiubix@gmail.com"
cd ~/.ssh
ssh-add id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub


echo '===============================================
SSH Key generated and copied to clipboard.
Add it in your account settings on github and bitbucket.'
