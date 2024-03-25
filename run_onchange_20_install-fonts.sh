#!/bin/sh

tmpdir=$(mktemp -d)
cd $tmpdir
wget "https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip"
unzip CascadiaCode-2111.01.zip
mkdir -p ~/.local/share/fonts
mv ttf/Cascadia* ~/.local/share/fonts/
cd ..
rm -rf $tmpdir

tmpdir=$(mktemp -d)
cd $tmpdir
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
cp ./MesloLGS* ~/.local/share/fonts/
cd ~
rm -rf $tmpdir
fc-cache -fv