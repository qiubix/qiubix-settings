#!/bin/zsh

export TERM=xterm-256color

# Java version switcher
export PATH="$HOME/.jenv/libexec:$PATH"
eval "$(jenv init -)"

# work
export JBOSS_HOME=/home/$USER/libs/syncron-wildfly-9.0.2.final/jboss-as

export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"

export AWS_PROFILE=867957065351_PowerUserPlusDev

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"

export SETTINGS=~/qiubix-settings

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
