#!/usr/bin/zsh

# This file is responsible for installing packages 
# from the AUR and other sources.

# spotify
git clone https://aur.archlinux.org/spotify.git
cd spotify
makepkg -si
cd ..
rm -rf spotify

# vs-code
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si
cd ..
rm -rf visual-studio-code-bin

# Install some vs-code extensions
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss

# mongodb
git clone https://aur.archlinux.org/mongodb-bin.git
cd mongodb-bin
makepkg -si
cd ..
rm -rf mongodb-bin

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.zshrc
nvm install --lts

# pure prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"