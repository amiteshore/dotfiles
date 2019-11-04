#!/bin/bash

# Google Chrome

# wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb


# Node.js

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm install --lts
# nvm use --lts


# Deno

# curl -fsSL https://deno.land/x/install/install.sh | sh
# export PATH="$HOME/.deno/bin:$PATH"


# Yarn

# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# apt update
# apt install yarn --yes


# MongoDB

# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
# echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
# apt update
# apt install mongodb-org --yes


# Persepolis

# add-apt-repository ppa:persepolis/ppa
# apt update
# apt install persepolis --yes


# Java JDK 12

# add-apt-repository ppa:linuxuprising/java
# apt install oracle-java12-installer --yes
# java -version


# Go

# wget -P ~/Downloads https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
# tar -xvf ~/Downloads/go1.13.4.linux-amd64.tar.gz -C ~/usr/local

# Rust 

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Docker

# apt update
# apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# apt update
# apt-cache policy docker-ce
# apt install docker-ce