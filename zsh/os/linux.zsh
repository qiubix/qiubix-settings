#!/bin/zsh
#
# linux.zsh — Linux-specific aliases & env. Auto-loaded when $OSTYPE is linux*.

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias list='ls -lhgop'

# Check and purge obsolete kernels
alias kernels='dpkg --list | grep linux-image'

# Display / VPN (Syncron Linux workstation)
alias display-setup='xrandr --output eDP1 --auto --pos 0x0 --output DP1-1 --auto --pos 1920x0 --output DP1-2 --auto --pos 3840x0'
alias vpn-up='nmcli con up id SyncronVPN'
alias vpn-down='nmcli con down id SyncronVPN'
