#!/bin/zsh

echo "Setting up brew..."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask-versions

echo "Setting up git..."
brew install git gh

echo "Setting up zsh..."
brew install tmux iterm2

echo "Setting up vim..."
brew install vim neovim

echo "Installing useful tools..."
brew install tree
brew install pre-commit
brew install tfenv jq go-task adr-tools

echo "Setting up JVM dev env..."
brew install --cask corretto17 corretto11
brew install --cask jetbrains-toolbox
git clone https://github.com/jenv/jenv.git $HOME/.jenv
brew install maven gradle

echo "Setting up docker..."
brew install colima docker-compose docker

echo "Setting up Python env..."
brew install pyenv python3

echo "Installing apps..."
brew install --cask spotify
brew install --cask timeular
brew install --cask obsidian
brew install --cask todoist
brew install --cask vanilla rocket
brew install --cask balance-lock
brew install --cask rescuetime
brew install --cask sync

# LaTeX
brew install basictex
