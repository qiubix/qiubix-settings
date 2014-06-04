#!/bin/bash

clear

# ========== install vim ==========
sudo apt-get install vim

# ========== copy vim settings from settings repo ==========
cp ~/qiubix-settings/.vimrc ~

# ========== install pathogen ==========
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ==========================================
# ========== PLUGINS INSTALLATION ==========
# ==========================================

# ========== airline ==========
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

# ========== git-gutter ==========
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# ========== fugitive ==========
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# ========== solarized color theme ==========
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized