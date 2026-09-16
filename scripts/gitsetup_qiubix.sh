#!/bin/bash
#
# Personal git identity + SSH key setup (macOS).
#
# Most git config lives in the tracked ~/.gitconfig (symlinked from this repo),
# which already sets the personal user.name/email. This script only handles the
# per-machine bits: the global ignore file symlink and an SSH key.

set -e

# Global gitignore (referenced by ~/.gitconfig core.excludesfile)
ln -sf ~/qiubix-settings/.gitignore_global ~/.gitignore_global

# Personal identity (redundant with ~/.gitconfig, set explicitly for clarity)
git config --global user.name qiubix
git config --global user.email qiubix@gmail.com
git config --global github.user qiubix

# SSH key
KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$KEY" ]; then
  ssh-keygen -t ed25519 -C "qiubix@gmail.com" -f "$KEY"
fi
pbcopy < "$KEY.pub"

echo '==============================================='
echo 'SSH public key copied to clipboard.'
echo 'Add it in your account settings on GitHub / etc.'
