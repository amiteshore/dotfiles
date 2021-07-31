#!/usr/bin/zsh

# Install packages from the official arch repo, AUR and other sources

# =============== Utils =============== #
sudo pacman -S xorg          # group
sudo pacman -S base-devel    # group
sudo pacman -S xorg-xinit
sudo pacman -S firefox-developer-edition
sudo pacman -S alacritty
sudo pacman -S tmux
sudo pacman -S neovim
sudo pacman -S code
sudo pacman -S wget
sudo pacman -S curl
sudo pacman -S fzf
sudo pacman -S ufw
sudo pacman -S tree
sudo pacman -S bat
sudo pacman -S exa
sudo pacman -S ranger
sudo pacman -S rsync
sudo pacman -S openssh
sudo pacman -S htop
sudo pacman -S neofetch
sudo pacman -S feh
sudo pacman -S rofi
sudo pacman -S pulseaudio
sudo pacman -S aria2
sudo pacman -S thunar
sudo pacman -S xsel
sudo pacman -S numlockx
sudo pacman -S zsh-autosuggestions           # zsh plugin
sudo pacman -S zsh-syntax-highlighting       # zsh plugin
sudo pacman -S zsh-history-substring-search  # zsh plugin
sudo pacman -S zsh-completions               # zsh plugin

# =============== Development =============== #
sudo pacman -S mariadb
sudo pacman -S redis
sudo pacman -S docker
sudo pacman -S httpie
sudo pacman -S nginx

# =============== Ricing =============== #
sudo pacman -S i3-gaps
sudo pacman -S i3status
sudo pacman -S i3lock
sudo pacman -S gnome-themes-extra

# =============== Fonts =============== #
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-font-awesome
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-emoji

# AUR PACKAGES #

AUR_DIR="$HOME/Downloads/AUR"

# =============== google-chrome =============== #
git clone https://aur.archlinux.org/google-chrome.git "$AUR_DIR/google-chrome"
cd "$AUR_DIR/google-chrome"
makepkg -si
echo

# =============== spotify =============== #
git clone https://aur.archlinux.org/spotify.git "$AUR_DIR/spotify"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
cd $AUR_DIR/spotify
makepkg -si
echo

# =============== nvm & node =============== #
echo "\n" >> "$HOME/.zshrc"
echo -n "# Load nvm script" >> "$HOME/.zshrc"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.zshrc
nvm install node

# =============== npm global pagkages =============== #
npm install -g redis-commander nodemon

# =============== vim-plug =============== #
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# =============== code extensions =============== #
code --install-extension sdras.night-owl
code --install-extension PKief.material-icon-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension vscodevim.vim
code --install-extension humao.rest-client
