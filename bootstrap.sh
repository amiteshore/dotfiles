#!/bin/bash

cp ./.bash_aliases ~/
cp ./.bash_profile ~/
cp ./.bash_prompt ~/
cp ./.bashrc ~/
cp ./.vimrc ~/
cp ./.gitconfig ~/

./apt.sh
./install.sh
./code/extensions.sh

# Enable "minimize on click" on dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
