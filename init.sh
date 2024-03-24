#!/bin/bash

# Install curl
sudo apt-get install curl

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"
sudo mv ./bin/chezmoi /usr/local/bin/chezmoi
rm -rf ./bin

mkdir -p ~/.config/chezmoi
echo "sourceDir: ~/dotfiles" > ~/.config/chezmoi/chezmoi.toml
chezmoi init https://github.com/Kryssz90/dotfiles --source ~/dotfiles