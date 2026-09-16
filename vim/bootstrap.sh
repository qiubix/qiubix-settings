#!/bin/bash

# Neovim (vim/nvim, Lua config) is the primary editor.
# vimrc-server.vim is a minimal, no-plugin fallback for plain `vim`
# (e.g. on remote boxes). The classic Vundle config lives in vim/legacy/
# and is intentionally not deployed.

echo "Linking editor configs..."

# Minimal vim fallback -> ~/.vimrc
if [ -e ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc_old
fi
ln -sf ~/qiubix-settings/vim/vimrc-server.vim ~/.vimrc

# IdeaVim
if [ ! -e ~/.ideavimrc ]; then
  ln -s ~/qiubix-settings/vim/idea.vim ~/.ideavimrc
fi

# Neovim (primary)
if [ ! -e ~/.config/nvim ]; then
  mkdir -p ~/.config
  ln -s ~/qiubix-settings/vim/nvim ~/.config/nvim
fi

echo "Done. Neovim manages its own plugins (packer) on first launch."
