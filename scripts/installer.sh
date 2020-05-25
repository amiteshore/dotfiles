#!/bin/bash

sudo apt-get update

# Install everyday apps
sudo apt-get install --yes \
  vim \
	tmux \
  git \
  grep \
	tree \
  unzip \
  zsh \
  curl \
  wget \
	virtualbox \
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

GREEN='\033[0;32m';
NC='\033[0m'; # No Color

# google-chrome
echo "";
printf "Installing ${GREEN}google-chrome${NC}\n";
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

# brave-browser
echo "";
printf "Installing ${GREEN}brave-browser{NC}\n";
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt install brave-browser

# vscode
echo "";
printf "Installing ${GREEN}vscode${NC}\n";
sudo snap install code --classic

# code extensions
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension bierner.emojisense

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
packages=('typescript' 'nodemon' 'gtop' 'tldr');
echo "";
for pkg in "${packages[@]}"; do
  printf "Installing ${GREEN}${pkg}${NC}\n";
  npm install -g "$pkg"; 
  echo "";
done;
unset pkg;
unset packages;

# Deno
printf "Installing ${GREEN}deno${NC}\n";
curl -fsSL https://deno.land/x/install/install.sh | sh

# Manually appending to ~/.bashrc (Deno doesn't append automatically)
echo "" >> ~/.bashrc
echo "export DENO_INSTALL=\"\$HOME/.deno\";" >> ~/.bashrc
echo "export PATH=\"\$DENO_INSTALL/bin:\$PATH\";" >> ~/.bashrc

# mongodb
echo "";
printf "Installing ${GREEN}mongodb${NC}\n";
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# remove no-longer-used apps
sudo apt-get autoremove

unset GREEN;
unset NC;