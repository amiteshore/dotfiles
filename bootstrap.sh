#!/bin/bash

cp ./.aliases ~/
cp ./.bash_profile ~/
cp ./.bashrc ~/
cp ./.vimrc ~/
cp ./.gitconfig ~/
cp ./.selected_editor ~/

./apt.sh
./install.sh
./code/extensions.sh
./gsettings.sh

# Make zsh my default shell
chsh -s $(which zsh)
