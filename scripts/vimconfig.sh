#!/bin/bash

clear
echo "Installing vim..."

# ========== install vim ==========
sudo apt-get install vim curl

# ========== copy vim settings from settings repo ==========
echo "Copying vim settings..."
if [ ! -f ~/.vimrc ]; then
  ln -s ~/qiubix-settings/.vimrc ~/.vimrc
fi
if [ ! -f ~/.ideavimrc ]; then
  ln -s ~/qiubix-settings/.ideavimrc ~/.ideavimrc
fi
if [ ! -f ~/.qtcreatorvimrc ]; then
  ln -s ~/qiubix-settings/.qtcreatorvimrc ~/.qtcreatorvimrc
fi

# ========== install pathogen ==========
echo "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ==========================================
# ========== PLUGINS INSTALLATION ==========
# ==========================================
echo "Installing plugins..."

# ========== airline ==========
if [ ! -d ~/.vim/bundle/vim-airline ]; then
  git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
fi

# ========== surround ==========
if [ ! -d ~/.vim/bundle/vim-surround ]; then
  git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
fi

# ========== git-gutter ==========
if [ ! -d ~/.vim/bundle/vim-gitgutter ]; then
  git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
fi

# ========== fugitive ==========
if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
  git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
fi

# ========== CtrlP ==========
if [ ! -d ~/.vim/bundle/ctrlp ]; then
  git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp
fi

# ========== NERDTree ==========
if [ ! -d ~/.vim/bundle/nerdtree ]; then
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# ========== numbers ==========
if [ ! -d ~/.vim/bundle/numbers ]; then
  git clone https://github.com/myusuf3/numbers.vim.git ~/.vim/bundle/numbers
fi

# ========== solarized color theme ==========
if [ ! -d ~/.vim/bundle/vim-colors-solarized ]; then
  git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
fi
