#!/bin/zsh
#
# path.zsh — user & tool PATH additions.
# Foundational PATH (system bins, brew) is in .zprofile; version-manager PATHs are
# in runtimes.zsh; machine/host-specific paths are in local.zsh.

typeset -gU path fpath

path=(
  $HOME/.local/bin(N)
  $HOME/.bin(N)
  $HOME/go/bin(N)
  $HOME/.opencode/bin(N)
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"(N)
  $path
)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
path=($PNPM_HOME/bin(N) $path)
