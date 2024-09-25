#!/bin/zsh

# Local settings

# Java version switcher
export PATH="$HOME/.jenv/libexec:$PATH"
eval "$(jenv init -)"

export PATH="$HOME/.bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export AWS_PROFILE=867957065351_PowerUserPlusDev
export AWS_INV_DEV=867957065351_PowerUserPlusDev
export AWS_INV_STAGING=838805440704_PowerUserPlusDev

export SPARK_HOME=/opt/homebrew/Cellar/apache-spark/3.5.1/libexec

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=${HOME}/.colima/docker.sock
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

source <(kubectl completion zsh)

# Node version manager completion is disabled for now, as it seems to be really slow
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

