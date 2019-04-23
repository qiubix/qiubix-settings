#!/bin/bash

echo "Installing zsh..."
sudo apt-get install -y zsh

echo "Making zsh your default shell..."
chsh -s /bin/zsh

echo "Setting up zsh to be the most awesome shell..."

curl -sL git.io/antibody | sh -s
ln -s ~/qiubix-settings/zsh/zshrc.symlink ~/.zshrc

# end of setup based on prezto

echo "Done :)"
echo "Logout and login for full effect."
