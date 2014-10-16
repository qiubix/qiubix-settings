#!/bin/bash

clear
echo "Installing vim..."

# ========== install vim ==========
sudo apt-get install vim curl

# ========== copy vim settings from settings repo ==========
echo "Copying vim settings..."
cp ~/qiubix-settings/.vimrc ~

# ========== install pathogen ==========
echo "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ==========================================
# ========== PLUGINS INSTALLATION ==========
# ==========================================
echo "Installing plugins..."

# ========== airline ==========
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

# ========== git-gutter ==========
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# ========== fugitive ==========
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# ========== numbers ==========
git clone https://github.com/myusuf3/numbers.vim.git ~/.vim/bundle/numbers

# ========== solarized color theme ==========
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
