#!/bin/zsh
#
# macos.zsh — macOS-specific aliases & env. Auto-loaded when $OSTYPE is darwin*.

alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lha'
alias list='ls -lhgop'

# Docker / Colima
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
