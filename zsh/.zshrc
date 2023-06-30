#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Zsh options.
setopt extended_glob

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote


#ZSH_DISABLE_COMPFIX=true
# Init completion (must be after antidote init)
#autoload -Uz compinit && compinit

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Prompt
# setopt PROMPT_SUBST
# setopt CORRECT
# setopt COMPLETE_IN_WORD
# autoload -Uz promptinit; promptinit
# prompt pure

#autoload -Uz compinit && compinit

source "${ZDOTDIR:-$HOME}/env.zsh"
