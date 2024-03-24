#!/bin/bash

if [ ! -d ~/.oh-my-zsh ]; then
    export RUNZSH="no"
    export KEEP_ZSHRC="yes"
    export CHSH="no"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
fi

if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d ~/.config/i3 ]; then
    mkdir -p ~/.config/i3
fi
if [ ! -f ~/.config/i3/local ]; then
    touch ~/.config/i3/local.config
fi