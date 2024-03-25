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

if [ ! -f ~/.local/bin/greenclip ]; then
    mkdir -p ~/.local/bin
    tmpdir=$(mktemp -d)
    cd $tmpdir
    wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
    mv ./greenclip ~/.local/bin
    chmod +x ~/.local/bin/greenclip
    cd ~
    rm -rf $tmpdir
fi
