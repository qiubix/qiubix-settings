#!/bin/zsh
#
# runtimes.zsh — language/runtime version managers.
# NOTE: jenv, pyenv and mise all initialize here. This is intentionally redundant
# for now; mise could eventually replace jenv + pyenv.

# jenv — Java
export PATH="$HOME/.jenv/libexec:$PATH"
command -v jenv >/dev/null && eval "$(jenv init -)"

# pyenv — Python
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# mise — polyglot runtime manager
[[ -x "$HOME/.local/bin/mise" ]] && eval "$("$HOME/.local/bin/mise" activate zsh)"
