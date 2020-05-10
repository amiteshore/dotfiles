#!/bin/bash

####################################################################
# UI 
####################################################################

# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Show weekday in clock
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Disply clock in 12h format
gsettings set org.gnome.desktop.interface clock-format '12h'

# Auto-hide the Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed 'false'

# Move the titlebar buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Hide home icon from desktop
gsettings set org.gnome.shell.extensions.desktop-icons show-home 'false'

# Hide trash icon from desktop
gsettings set org.gnome.shell.extensions.desktop-icons show-trash 'false'

# Download and set macOS Sierra wallpaper
wget -P ~/Pictures https://ismh.s3.amazonaws.com/macos-wallpapers/10-12.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/amit/Pictures/10-12.jpg'
gsettings set org.gnome.desktop.background picture-options 'stretched'

####################################################################
# Terminal 
####################################################################

# Hide the menubar in new windows
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# Keyboard shortcut to switch to the next tab
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Right'

# Keyboard shortcut to switch to the previous tab
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary>Left'

# Keyboard shortcut to open the Preferences dialog
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ preferences '<Primary>p'

# Toggle the visibility of the menubar
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ toggle-menubar '<Primary>m'

echo "Done. Note that some of these changes require a logout/restart to take effect."
