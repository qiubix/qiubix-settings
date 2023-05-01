#!/bin/bash

echo "Installing vim..."

# ========== install vim ==========
# sudo apt install vim-gnome ack-grep silversearcher-ag
# brew install vim

# ========== copy vim settings from settings repo ==========
echo "Copying vim settings..."

if [ ! -f ~/.vimrc ]; then
  ln -s ~/qiubix-settings/vim/vimrc.vim ~/.vimrc
else
  mv ~/.vimrc ~/.vimrc_old
  ln -s ~/qiubix-settings/vim/vimrc.vim ~/.vimrc
fi

if [ ! -f ~/.vim-bundles ]; then
  ln -s ~/qiubix-settings/vim/vim-bundles.vim ~/.vim-bundles
fi

if [ ! -f ~/.ideavimrc ]; then
  ln -s ~/qiubix-settings/vim/idea.vim ~/.ideavimrc
fi

# ==========================================
# ========== PLUGINS INSTALLATION ==========
# ==========================================
echo "Installing plugins..."

# Vim is self-bootstraping
vim +PluginInstall +qall

if [ -f ~/.vim/bundle/YouCompleteMe ]; then
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --clang-completer
fi
