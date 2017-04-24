#!/bin/bash

echo "Installing zsh..."
sudo apt-get install -y zsh

echo "Making zsh your default shell..."
chsh -s /bin/zsh

echo "Setting up zsh to be the most awesome shell..."

# ZSH setup based on oh-my-zsh:

# echo "Setting up prompt and plugins..."
# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# ln -s ~/qiubix-settings/oh-my-zsh/.zshrc ~/.zshrc
# echo "Adding qiubix zsh theme..."
# ln -s ~/qiubix-settings/oh-my-zsh/.oh-my-zsh/themes/qiubix.zsh-theme ~/.oh-my-zsh/themes/qiubix.zsh-theme 

# end of setup based on oh-my-zsh

# ZSH setup based on prezto:
echo "Setting up prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Configuring prezto..."
ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout

echo "Creating symbolic links for customized config files..."
ln -s ~/qiubix-settings/prezto/zpreztorc ~/.zpreztorc
ln -s ~/qiubix-settings/prezto/zprofile ~/.zprofile
ln -s ~/qiubix-settings/prezto/zshrc ~/.zshrc
ln -s ~/qiubix-settings/prezto/zshenv ~/.zshenv
ln -s ~/qiubix-settings/prezto/prompt_qiubix_setup ~/.zprezto/modules/prompt/functions/prompt_qiubix_setup
ln -s ~/qiubix-settings/prezto/prompt_qiubix2_setup ~/.zprezto/modules/prompt/functions/prompt_qiubix2_setup

# end of setup based on prezto

echo "Done :)"
echo "Logout and login for full effect."
