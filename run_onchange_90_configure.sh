#!/bin/sh

echo "Set default window manager"
# sudo update-alternatives --set x-session-manager /usr/bin/i3

echo "Set default terminal"
# sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

echo "Set default shell"
chsh -s /usr/bin/zsh