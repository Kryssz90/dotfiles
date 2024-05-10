#!/bin/bash

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 

source ~/.nvm/nvm.sh
nvm install 20

# Install tsserver
npm install -g typescript