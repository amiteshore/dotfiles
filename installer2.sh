#!/usr/bin/zsh

# Install packages from the AUR and other sources

AUR_DIR="$HOME/Downloads/AUR"

# google-chrome
git clone https://aur.archlinux.org/google-chrome.git "$AUR_DIR/google-chrome"
cd "$AUR_DIR/google-chrome"
makepkg -si
echo # Add empty line

# spotify
git clone https://aur.archlinux.org/spotify.git "$AUR_DIR/spotify"
cd "$AUR_DIR/spotify"
makepkg -si
echo # Add empty line

# vs-code
git clone https://aur.archlinux.org/visual-studio-code-bin.git "$AUR_DIR/visual-studio-code-bin"
cd "$AUR_DIR/visual-studio-code-bin"
makepkg -si
echo # Add empty line

# Install some vs-code extensions
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bierner.emojisense
code --install-extension aaron-bond.better-comments
code --install-extension yzhang.markdown-all-in-one

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.zshrc
nvm install node