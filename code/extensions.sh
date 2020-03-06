#!/usr/bin/env bash

# Install extensions
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension ritwickdey.LiveServer
code --install-extension bierner.emojisense

# Remove Code configurations if already exists
if [ -f ~/.config/Code/User/settings.json ]; then
  rm ~/.config/Code/User/settings.json
fi

if [ -f ~/.config/Code/User/keybindings.json ]; then
  rm ~/.config/Code/User/keybindings.json
fi

# Copy settings to Code's config directrory
cp ./settings.json ~/.config/Code/User/settings.json
cp ./keybindings.json ~/.config/Code/User/keybindings.json