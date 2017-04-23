#!/bin/bash

echo "Configuring shell..."

echo "Setting ignore case on completion..."
echo "set completion-ignore-case On" >> ~/.inputrc
echo "Done."

echo "Mapping CAPS LOCK key to LEFT CTRL..."
echo "XKBOPTIONS=\"ctrl:nocaps\"" | sudo tee -a /etc/default/keyboard
echo "Done. Logout and login for changes to impact your system."
