#!/bin/zsh

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'
alias mkdir='mkdir -v'
alias list='ls -lhgop'
#alias grep='grep -rni'

# reboot/shutdown
alias off='sudo shutdown -h now'
alias reboot='sudo reboot'

# editor and programs
alias tree='tree -CF'
#alias edit='gnome-open'

# ----------------------
# additional git aliases
# ----------------------
alias gst='git status'
alias ga='git add'
alias gdl='git ls-files'
alias gd='git diff'
alias glgg='git log --graph --max-count=10'
alias glog='git log --oneline --decorate --color --graph'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

# ----------------------
# other aliases
# ----------------------

# Check and purge obsolete kernels
alias kernels='dpkg --list | grep linux-image'


# -----------------
# Linux @ Syncron
# -----------------
alias display-setup='xrandr --output eDP1 --auto --pos 0x0 --output DP1-1 --auto --pos 1920x0 --output DP1-2 --auto --pos 3840x0'
alias vpn-up='nmcli con up id SyncronVPN'
alias vpn-down='nmcli con down id SyncronVPN'
