#!/bin/sh

wget "https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip"
unzip CascadiaCode-2111.01.zip
mkdir -p ~/.local/share/fonts
mv ttf/Cascadia* ~/.local/share/fonts/