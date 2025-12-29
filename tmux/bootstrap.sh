#!/bin/bash

brew install tmux tmuxp

export TERM=xterm-256color
# alias tmux='tmux -2'
# alias tmux='TERM=xterm-256color /home/$USER/bin/tmux -2'
# alias start-tmux='~/tmux-startup.sh && tmux attach -t coding'

ln -s ~/qiubix-settings/tmux/tmuxp-configs ~/.tmuxp
ln -s ~/qiubix-settings/tmux/start-tmux.sh ~/start-tmux.sh

