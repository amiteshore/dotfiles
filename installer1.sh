#!/usr/bin/zsh

# This file is responsible for installing packages
# from the official arch repository.

#--------------- UTILITIES ---------------#
pacman -S xorg          # group
pacman -S base-devel    # group
pacman -S xorg-xinit
pacman -S alarcritty
pacman -S zsh
pacman -S zsh-autosuggestions
pacman -S zsh-syntax-highlighting
pacman -S git
pacman -S wget
pacman -S curl
pacman -S ufw
pacman -S tree
pacman -S unzip
pacman -S tar
pacman -S htop
pacman -S neofetch
pacman -S feh
pacman -S pulseaudio
pacman -S rofi
pacman -S openssh
pacman -S polkit
pacman -S aria2

#--------------- RICING ---------------#
pacman -S i3-gaps
pacman -S i3status
pacman -S i3lock

#--------------- GUI ---------------#
pacman -S chromium
pacman -S vlc

#--------------- DEVELOPMENT ---------------#
pacman -S docker

#--------------- FONTS ---------------#
pacman -S ttf-fira-code
pacman -S ttf-font-awesome
pacman -S noto-fonts-emoji
pacman -S noto-fonts