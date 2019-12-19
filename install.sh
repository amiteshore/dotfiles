#!/bin/bash

# Google Chrome

wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb


# Node.js

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
nvm use --lts


# Deno

curl -fsSL https://deno.land/x/install/install.sh | sh
export DENO_INSTALL="/home/amit/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# Yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn --yes


# MongoDB

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update
sudo apt install mongodb-org --yes


# Persepolis

sudo add-apt-repository ppa:persepolis/ppa
sudo apt update
sudo apt install persepolis --yes


# Java JDK 12

sudo add-apt-repository ppa:linuxuprising/java
sudo apt install oracle-java12-installer --yes
java -version


# Go

wget -P ~/Downloads https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
sudo tar -xvf ~/Downloads/go1.13.4.linux-amd64.tar.gz -C ~/usr/local

# Rust 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Docker

sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce