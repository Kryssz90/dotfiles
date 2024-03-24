#!/bin/sh

add_ppa() {
    sudo add-apt-repository -r ppa:$1
    sudo add-apt-repository ppa:$1
}

echo "Adding PPAs..."
# add_ppa webupd8team/indicator-kdeconnect

echo "Install i3"
# Check if sur5r-i3 repository is already added
if ! grep -q "sur5r-i3" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
    sudo apt install ./keyring.deb
    echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
    sudo apt update
    sudo apt install i3
    rm keyring.deb
fi

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
    picom \
    i3lock-fancy \
    jq \
    peek \
    pulseeffects \
    rofi \
    zoxide \
    kdeconnect

