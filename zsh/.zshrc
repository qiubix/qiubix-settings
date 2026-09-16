#!/bin/zsh
#
# .zshrc — interactive shell orchestrator.
#
# Entrypoint chain: ~/.zshenv (sets ZDOTDIR) -> .zprofile (login) -> THIS FILE.
# This file loads plugins, then sources one file per concern, in order:
#   path -> env -> runtimes -> completions -> aliases -> os/<os> -> local -> secrets
#

# Zsh options.
setopt extended_glob

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# zstyles (used by antidote/completion).
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Plugins via antidote (clone on first run).
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Completion system (after antidote so $fpath is fully populated).
autoload -Uz bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# Config — one concern per file.
for _conf in path env runtimes completions aliases; do
  source "$ZDOTDIR/$_conf.zsh"
done
unset _conf

# OS-specific (tracked).
case "$OSTYPE" in
  darwin*) _os=macos ;;
  linux*)  _os=linux ;;
esac
[[ -n "${_os:-}" && -r "$ZDOTDIR/os/$_os.zsh" ]] && source "$ZDOTDIR/os/$_os.zsh"
unset _os

# Machine-local (untracked).
[[ -r "$ZDOTDIR/local.zsh" ]]   && source "$ZDOTDIR/local.zsh"
[[ -r "$ZDOTDIR/secrets.zsh" ]] && source "$ZDOTDIR/secrets.zsh"
