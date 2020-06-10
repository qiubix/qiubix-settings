#!/bin/zsh

export TERM=xterm-256color

# Java version switcher
export PATH="$HOME/.jenv/libexec:$PATH"
eval "$(jenv init -)"

# work
export JBOSS_HOME=/home/$USER/libs/syncron-wildfly-9.0.2.final/jboss-as
