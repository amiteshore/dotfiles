#!/usr/bin/env bash

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
nvm use --lts

# Deno
curl -fsSL https://deno.land/x/install/install.sh | sh
export PATH="$HOME/.deno/bin:$PATH"

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn --yes

# # MongoDB
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
# echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
# sudo apt update
# sudo apt install mongodb-org --yes

# # Persepolis
# sudo add-apt-repository ppa:persepolis/ppa
# sudo apt update
# sudo apt install persepolis --yes

# # Java JDK 12
# sudo add-apt-repository ppa:linuxuprising/java
# sudo apt install oracle-java12-installer --yes
# java -version

# # Go
# wget -P ~/Downloads https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
# sudo tar -xvf ~/Downloads/go1.12.7.linux-amd64.tar.gz -C ~/Downloads
# sudo mv ~/Downloads/go /usr/local