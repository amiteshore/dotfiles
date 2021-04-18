#!/usr/bin/zsh

# This file is responsible for installing packages
# from the official arch repository.

# =============== Utils =============== #
pacman -S xorg          # group
pacman -S base-devel    # group
pacman -S xorg-xinit
pacman -S alarcritty
pacman -S zsh
pacman -S clang
pacman -S wget
pacman -S curl
pacman -S ufw
pacman -S tree
pacman -S htop
pacman -S rsync
pacman -S neofetch
pacman -S feh
pacman -S pulseaudio
pacman -S rofi
pacman -S openssh
pacman -S polkit
pacman -S aria2
pacman -S bat
pacman -S exa
pacman -S ranger
pacman -S thunar
pacman -S numlockx
pacman -S zsh-autosuggestions           # zsh plugin
pacman -S zsh-syntax-highlighting       # zsh plugin
pacman -S zsh-history-substring-search  # zsh plugin
pacman -S zsh-completions               # zsh plugin

# =============== Development =============== #
pacman -S docker

# =============== Ricing =============== #
pacman -S i3-gaps
pacman -S i3status
pacman -S i3lock
pacman -S gnome-themes-extra

# =============== Fonts =============== #
pacman -S ttf-fira-code
pacman -S ttf-font-awesome
pacman -S noto-fonts
pacman -S noto-fonts-emoji
