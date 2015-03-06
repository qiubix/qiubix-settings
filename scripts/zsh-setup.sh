#!/bin/bash

echo "Installing zsh..."
sudo apt-get install zsh

echo "Making zsh your default shell..."
chsh -s /bin/zsh

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
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Creating symbolic links..."
ln -s ~/qiubix-settings/prezto/zpreztorc ~/.zpreztorc
ln -s ~/qiubix-settings/prezto/zprofile ~/.zprofile
ln -s ~/qiubix-settings/prezto/zshrc ~/.zshrc
ln -s ~/qiubix-settings/prezto/prompt_qiubix_setup ~/.zprezto/modules/prompt/functions/prompt_qiubix_setup
ln -s ~/qiubix-settings/prezto/prompt_qiubix2_setup ~/.zprezto/modules/prompt/functions/prompt_qiubix2_setup

# end of setup based on prezto

echo "Done :)"
