# qiubix-settings
My personal Linux system customization.

## Overview:
* bash scripts for installing and configuring software and tools
* dotfiles for zsh, vim, bash, git, tmux and more
* some custom color schemes

## Detailed table of contents
* scripts
  * programs - install and configure basic and favourite programs and tools
  * themes - download and install gtk themes, fonts and icons, set up default terminal color schemes
  * vimconfig - install and configure vim, setting up vimrc, download and setup plugins
  * gitsetup - set up basic global config for git, generate ssh key
  * zsh-setup - install and tweak your shell
* dotfiles
  * .zshrc - config for my favourite shell, setting up plugins, aliases and theme
  * .bashrc - basic setup for bash
  * .vimrc - config file with all settings making vim better and more convinient, enabling specific plugins, mapping keys, configuring colors
  * and a few more...

## Installation
Basically everything can be set up with provided scripts.

**Important note:** scripts assume that you install those settings in your home directory. To do this just run:

`git clone https://github.com/qiubix/qiubix-settings.git ~/qiubix-settings`

Please note that if you have some configuration of vim, tmux or zsh, running provided scripts to install my configuration will most likely override your previous settings, so if you don't want to lose any of it, remember to create backup of those dotfiles ;) Simply clonning my settings won't mess anything up, so you can easily choose what you want to configure/copy.

By default scripts create symbolic links to dotfiles, instead of copying them, so it's much easier to track your changes.

### vim
Run `~/qiubix-settings/scripts/vimconfig.sh`. This will install vim (if you don't have it yet :P), copy vim settings to your home directory and run plugin installation.

**WARNING**: some plugins require powerline fonts to look much better, which can be set up with `scripts/themes.sh` script. If some characters/color themes are not displaying correctly, probably you should tweak your terminal settings, i.e. change terminal font to the one supporting powerline characters. And don't forget about backing up your previous vim config, if you had any :)

There are also alternative vim configs, which don't require any plugins and cover only basic settings. (`.vimrc.basic` covers all basic settings an can easily be used in a system where you don't want to install any plugins. `.vimrc.simple` adds a `:/;` remapping, which many people might find confusing, although it saves a lot of efford ;) )

### zsh
You can set up your shell to work with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) or with [prezto](https://github.com/sorin-ionescu/prezto). After using oh-my-zsh for a while I switched to prezto, so script works with it by default. If you want to switch back to oh-my-zsh just change comments in proper sections of the script.

Run `~/qiubix-settings/scripts/zsh-setup.sh`.

### themes
Script `themes.sh` downloads various themes, icons and cursors, sets up color schemes for different terminals and downloads powerline fonts.

**NOTE:** read this script before running, because you probably don't need all of that, so tailor it to your preferences ;)

### other scripts
Rest of the scripts provides a way to quickly install programs and tools which I use more or less frequently.
