#!/bin/bash

sudo apt-get install -y tmux

if [ -f $HOME/qiubix-settings/.tmux.conf ]; then
  ln -s $HOME/qiubix-settings/tmux.conf $HOME/.tmux.conf
fi

