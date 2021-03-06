#!/usr/bin/zsh

# This file is responsible for installing packages
# from the official arch repository.

# =============== Utils =============== #
pacman -S xorg          # group
pacman -S base-devel    # group
pacman -S xorg-xinit
pacman -S alarcritty
pacman -S zsh
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
pacman -S zsh-autosuggestions
pacman -S zsh-syntax-highlighting
pacman -S zsh-history-substring-search
pacman -S zsh-completions
pacman -S bat
pacman -S exa
pacman -S ranger
pacman -S thunar

# =============== Development =============== #
pacman -S docker

# =============== GUI =============== #
pacman -S chromium
pacman -S vlc

# =============== Fonts =============== #
pacman -S ttf-fira-code
pacman -S ttf-font-awesome
pacman -S noto-fonts-emoji
pacman -S noto-fonts

# =============== Ricing =============== #
pacman -S i3-gaps
pacman -S i3status
pacman -S i3lock
