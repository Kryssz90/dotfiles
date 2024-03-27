#!/bin/sh

if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "Creating new ssh key for github"
  ssh-keygen -t ed25519 -C "kryssz90@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi