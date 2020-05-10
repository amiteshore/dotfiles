#!/bin/bash

sudo apt-get update

# Install everyday apps
sudo apt-get install --yes \
  vim \
  git \
	grep \
	unzip \
  zsh \
  curl \
  wget \
  htop \
  gcc \
  clang-format \
  fonts-firacode \
  gnome-tweak-tool \
	chrome-gnome-shell \
  nginx \
  apache2 \
  mysql-server \
  php \
  php-mysql \
  libapache2-mod-php

# Secure mysql
sudo mysql_secure_installation

# Install vim.plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# google-chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

# vscode
sudo snap install code --classic

# code extensions
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension bierner.emojisense

GREEN='\033[0;32m';
NC='\033[0m'; # No Color

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm";
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";  # This loads nvm bash_completion

# Install node lts
echo "";
printf "Installing ${GREEN}node${NC}\n";
nvm install --lts

# Install useful global npm packages
echo "";
for package in typescript gtop nodemon
do
  printf "Installing ${GREEN}$package${NC}\n";
  npm install -g "$package" 
  echo "";
done

# Deno
printf "Installing ${GREEN}deno${NC}\n";
curl -fsSL https://deno.land/x/install/install.sh | sh

# Manually appending to ~/.bashrc (Deno doesn't append automatically)
echo "" >> ~/.bashrc
echo "export DENO_INSTALL=\"\$HOME/.deno\";" >> ~/.bashrc
echo "export PATH=\"\$DENO_INSTALL/bin:\$PATH\";" >> ~/.bashrc

# mongodb
printf "Installing ${GREEN}mongodb${NC}\n";
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# remove no-longer-used apps
sudo apt-get autoremove

unset GREEN;
unset NC;
