#!/usr/bin/zsh

# mkdir directories, if doesn't exists.
mkdir --verbose --parents $HOME/Downloads
mkdir --verbose --parents $HOME/Documents
mkdir --verbose --parents $HOME/Pictures
mkdir --verbose --parents $HOME/Temporary

mkdir --verbose --parents $HOME/projects
mkdir --verbose --parents $HOME/projects/dev
mkdir --verbose --parents $HOME/projects/temp

mkdir --verbose --parents $HOME/.vim
mkdir --verbose --parents $HOME/.zsh
mkdir --verbose --parents $HOME/.config

# install packages
./installer1.sh

# sync dotfiles to home directory
./sync.sh

./installer2.sh # run this after syncing the config files (specially for zsh)