#!/bin/bash
#
# Work (TouK) git identity + SSH key setup (macOS).
#
# Sets the global git identity to the work account, symlinks the global ignore
# file, and generates a work SSH key. Run gitsetup_qiubix.sh instead to switch
# back to the personal identity.

set -e

# Global gitignore (referenced by ~/.gitconfig core.excludesfile)
ln -sf ~/qiubix-settings/.gitignore_global ~/.gitignore_global

# Work identity
git config --global user.name "Karol Katerzawa"
git config --global user.email kkt@touk.pl

# SSH key
KEY="$HOME/.ssh/id_ed25519_touk"
if [ ! -f "$KEY" ]; then
  ssh-keygen -t ed25519 -C "kkt@touk.pl" -f "$KEY"
fi
pbcopy < "$KEY.pub"

echo '==============================================='
echo 'Work SSH public key copied to clipboard.'
echo 'Add it in your account settings on your git host.'
