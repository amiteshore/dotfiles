#!/bin/bash

# This script is for ubuntu-desktop
# Only run once after installing a fresh ubuntu-desktop

sudo apt-get update

# Uninstall apps that I'm not using
sudo apt-get purge --yes \
  remmina \
  rhythmbox \
  gnome-todo \
  gnome-mines \
  libreoffice* \
  gnome-sudoku \
  gnome-mahjongg \
  aisleriot \
	thunderbird
