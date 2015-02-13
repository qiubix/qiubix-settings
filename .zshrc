# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="bira"
#ZSH_THEME="gnzh"
ZSH_THEME="qiubix"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"
HISTCONTROL=ignoredubs:ignorespace

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode git-flow gradle)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$HOME/Qt5.1.1:$HOME/Qt5.1.1/5.1.1/gcc_64/lib/cmake:$HOME/gmock1.7.0
export GMOCK_ROOT=$HOME/gmock-1.7.0
export GMOCK_HOME=$HOME/gmock-1.7.0
export GTEST_ROOT=$GMOCK_ROOT/gtest
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# DisCODe installation
export DISCODE_DCL_DIR=/home/qiubix/DCL
export PATH=$PATH:/home/qiubix/DisCODe/build/inst/bin

# ns2 installation
export PATH=$PATH:/home/qiubix/ns-allinone-2.35/bin:/home/qiubix/ns-allinone-2.35/tcl8.5.10/unix:/home/qiubix/ns-allinone-2.35/tk8.5.10/unix
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/qiubix/ns-allinone-2.35/otcl-1.14:/home/qiubix/ns-allinone-2.35/lib
export TCL_LIBRARY=$TCL_LIBRARY:/home/qiubix/ns-allinone-2.35/tcl8.5.10/library

# obsolete kernel removal commands
# alias kernels = 'dpkg --list | grep linux-image'
# sudo apt-get purge linux-image-x.x.x.x-generic
# sudo update-grub2
# reboot

# tmux setup
alias tmux='TERM=xterm-256color /home/$USER/bin/tmux'

# ==================================================
# ALIASES
# ==================================================
alias ls='ls --color=auto'
alias rm='rm -vI'
alias mv='mv -vi'
alias mkdir='mkdir -v'
alias list='ls -lhgop'
alias grep='grep -rni'

alias off='sudo shutdown -h now'
alias reboot='sudo reboot'

bindkey -M viins 'jk' vi-cmd-mode
