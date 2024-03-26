#!/bin/bash

# Install curl
sudo apt-get install curl

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"
sudo mv ./bin/chezmoi /usr/local/bin/chezmoi
rm -rf ./bin
chezmoi init https://github.com/Kryssz90/dotfiles --apply