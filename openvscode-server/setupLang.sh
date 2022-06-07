#!/bin/bash

if [ $(id -u) = 0 ]; then
   echo "Don't run as root!"
   exit 1
fi

sudo apt update -y
sudo apt install curl git mercurial make binutils bison gcc tcc build-essential -y # Installs GVM requirements, and also GCC for C/C++
sudo apt install python3 python3-pip -y # Install Python

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) # Install GVM for Golang
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # Install NVM for NodeJS, though refer to https://github.com/nvm-sh/nvm for latest versions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /root/.gvm/scripts/gvm