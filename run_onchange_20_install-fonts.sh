#!/bin/sh

tmpdir=$(mktemp -d)
cd $tmpdir
wget "https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip"
unzip CascadiaCode-2111.01.zip
mkdir -p ~/.local/share/fonts
mv ttf/Cascadia* ~/.local/share/fonts/
cd ..
rm -rf $tmpdir


sudo apt install fontconfig
cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd ~
rm Meslo.zip
fc-cache -fv