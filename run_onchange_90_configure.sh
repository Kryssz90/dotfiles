#!/bin/sh

echo "Set default window manager"
sudo update-alternatives --set x-session-manager /usr/bin/i3

echo "Set default terminal"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /snap/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator

echo "Set default shell"
chsh -s /usr/bin/zsh