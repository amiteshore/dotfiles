#!/bin/bash

# This script is for ubuntu-desktop
# Only run once after installing a fresh ubuntu-desktop

sudo apt-get update

# Uninstall apps that I'm not using
sudo apt-get purge --yes \
  aisleriot \
	firefox \
  libreoffice* \
  gnome-todo \
  gnome-mines \
  gnome-sudoku \
  gnome-mahjongg \
	thunderbird \
  remmina \
  rhythmbox 