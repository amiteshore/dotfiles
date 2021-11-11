#!/usr/bin/zsh

# Install packages from the official arch repo, AUR and other sources

# =============== Utils =============== #
sudo pacman -S xorg           # group
sudo pacman -S base-devel     # group
sudo pacman -S i3             # group
sudo pacman -S xorg-xinit
sudo pacman -S firefox-developer-edition
sudo pacman -S discord
sudo pacman -S alacritty
sudo pacman -S starship
sudo pacman -S ripgrep
sudo pacman -S fd
sudo pacman -S bat
sudo pacman -S exa
sudo pacman -S fzf
sudo pacman -S tmux
sudo pacman -S wget
sudo pacman -S curl
sudo pacman -S ufw
sudo pacman -S tree
sudo pacman -S rsync
sudo pacman -S openssh
sudo pacman -S htop
sudo pacman -S neofetch
sudo pacman -S feh
sudo pacman -S rofi
sudo pacman -S aria2
sudo pacman -S thunar
sudo pacman -S xsel
sudo pacman -S numlockx
sudo pacman -S zsh-autosuggestions           # zsh plugin
sudo pacman -S zsh-syntax-highlighting       # zsh plugin
sudo pacman -S zsh-history-substring-search  # zsh plugin
sudo pacman -S zsh-completions               # zsh plugin
sudo pacman -S gnome-themes-extra
sudo pacman -S python-pynvim

# =============== Bluetooth and audio =============== #
sudo pacman -S pulseaudio
sudo pacman -S pulseaudio-alsa
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S bluez-hid2hci

# =============== Development =============== #
sudo pacman -S mariadb
sudo pacman -S redis
sudo pacman -S docker
sudo pacman -S httpie
sudo pacman -S nginx
sudo pacman -S clang
sudo pacman -S python
sudo pacman -S python-pip
sudo pacman -S code

# =============== Fonts =============== #
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-font-awesome
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-emoji

# AUR PACKAGES #

AUR_DIR="$HOME/Downloads/AUR"

# =============== neovim nightly =============== #
git clone https://aur.archlinux.org/neovim-nightly-bin.git "$AUR_DIR/neovim-nightly-bin"
cd "$AUR_DIR/neovim-nightly-bin"
makepkg -si
echo

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.zshrc
nvm install node

# =============== npm global pagkages =============== #
npm install -g typescript ts-node sass ngrok redis-commander nodemon live-server

# =============== vim-plug =============== #
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
