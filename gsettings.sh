#!/bin/bash

# Enable "minimize on click" on dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Set Dock icon size 
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size '64'

# Auto-hide the Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed 'false'

# Move the titlebar buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Hide home icon from desktop
gsettings set org.gnome.shell.extensions.desktop-icons show-home 'false'

# Hide trash icon from desktop
gsettings set org.gnome.shell.extensions.desktop-icons show-trash 'false'
