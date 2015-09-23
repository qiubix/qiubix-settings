#!/bin/bash

clear
echo "Installing vim..."

# ========== install vim ==========
sudo apt-get install vim-gnome ack-grep silversearcher-ag

# ========== copy vim settings from settings repo ==========
echo "Copying vim settings..."

if [ ! -f ~/.vimrc ]; then
  ln -s ~/qiubix-settings/.vimrc ~/.vimrc
else
  mv ~/.vimrc ~/.vimrc_old
  ln -s ~/qiubix-settings/.vimrc ~/.vimrc
fi

if [ ! -f ~/.vimrc.bundles ]; then
  ln -s ~/qiubix-settings/.vimrc.bundles ~/.vimrc.bundles
fi

if [ ! -f ~/.ideavimrc ]; then
  ln -s ~/qiubix-settings/.ideavimrc ~/.ideavimrc
fi

if [ ! -f ~/.qtcreatorvimrc ]; then
  ln -s ~/qiubix-settings/.qtcreatorvimrc ~/.qtcreatorvimrc
fi

if [ ! -f ~/.vim ]; then
  ln -s ~/qiubix-settings/.vim ~/.vim
fi

# ==========================================
# ========== PLUGINS INSTALLATION ==========
# ==========================================
echo "Installing plugins..."

# ========== Vundle for managing plugins ==========
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

if [ -f ~/.vim/bundle/YouCompleteMe ]; then
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --clang-completer
fi
