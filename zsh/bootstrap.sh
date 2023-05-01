#!/bin/bash

echo 'Current OS:'

case "$(uname -sr)" in

  Darwin*)
    echo 'Mac OS X'
    ;;

  Linux*Microsoft*)
    echo 'WSL'  # Windows Subsystem for Linux
    ;;

  Linux*)
    echo 'Linux'
    echo "Installing zsh..."
    sudo apt-get install -y zsh

    echo "Making zsh your default shell..."
    chsh -s /bin/zsh
    ;;

  CYGWIN*|MINGW*|MINGW32*|MSYS*)
    echo 'MS Windows'
    ;;

   # Add here more strings to compare
   # See correspondence table at the bottom of this answer

   *)
   echo 'Other OS'
   ;;
esac


echo "Setting up zsh to be the most awesome shell..."

curl -sL git.io/antibody | sh -s
ln -s ~/qiubix-settings/zsh/zshrc.symlink ~/.zshrc


echo "Done :)"
echo "Logout and login for full effect."
