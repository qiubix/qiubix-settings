#!/bin/zsh
#
# aliases.zsh — shared, OS-neutral aliases.
# OS-specific aliases live in os/macos.zsh and os/linux.zsh.

alias mkdir='mkdir -v'
alias tree='tree -CF'
alias v='nvim'

# reboot/shutdown
alias off='sudo shutdown -h now'
alias reboot='sudo reboot'

# git
alias gst='git status'
alias gc='git commit --verbose'
alias ga='git add'
alias gdl='git ls-files'
alias gd='git diff'
alias glgg='git log --graph --max-count=10'
alias glog='git log --oneline --decorate --color --graph'

# terraform / terragrunt
alias infra='terraform -chdir=infra'
alias tg='terragrunt'
