#!/bin/sh

add_ppa() {
    sudo add-apt-repository -r ppa:$1
    sudo add-apt-repository ppa:$1
}

echo "Adding PPAs..."
# add_ppa webupd8team/indicator-kdeconnect

sudo apt update

echo "Installing APT packages..."
sudo apt install \
    arandr \
    curl \
    diffutils \
    ethtool \
    gimp \
    git \
    gzip \
    mc \
    nomacs \
    pulseaudio \
    tmux \
    vlc \
    whois \
    zip \
    zsh \
    fzf \
    i3 \
    i3lock-fancy \
    jq \
    peek \
    pulseeffects \
    rofi \
    zoxide \
    kdeconnect

