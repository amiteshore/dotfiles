#!/usr/bin/zsh

# Install packages from the official arch repo, AUR and other sources

packages=(
  'xorg'              # group
  'base-devel'        # group
  'i3'                # group
  'firefox'
  'firefox-developer-edition'
  'discord'
  'alacritty'
  'kitty'
  'starship'
  'ripgrep'
  'fd'
  'bat'
  'exa'
  'fzf'
  'tmux'
  'wget'
  'curl'
  'ufw'
  'tree'
  'glances'
  'htop'
  'neofetch'
  'rsync'
  'zip'
  'unzip'
  'scrot'
  'imagemagick'
  'reflector'
  'openssh'
  'aria2'
  'ranger'
  'thunar'
  'rofi'
  'dunst'
  'xclip'
  # zsh plugins
  'zsh-autosuggestions'
  'zsh-syntax-highlighting'
  'zsh-history-substring-search'
  'zsh-completions'
  # bluetooth and audio
  'pulseaudio'
  'pulseaudio-alsa'
  'pulseaudio-bluetooth'
  'bluez'
  'bluez-utils'
  'bluez-hid2hci'
  # development
  'mariadb'
  'redis'
  'docker'
  'httpie'
  'nginx'
  'clang'
  'python'
  'python-pip'
  # fonts
  'ttf-fira-code'
  'ttf-font-awesome'
  'noto-fonts'
  'noto-fonts-emoji'
  # security
  'nmap'
  'wireshark-qt'
  # misc
  'cmatrix'
  'feh'
  'ueberzug'
  'jq'
  'xorg-xinit'
  'xsel'
  'numlockx'
  'python-pynvim'
  'gnome-themes-extra'
)

sudo pacman -S ${packages[@]}

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
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import -
cd $AUR_DIR/spotify
makepkg -si
echo

# =============== nvm & node =============== #
echo "\n" >> "$HOME/.zshrc"
echo -n "# Load nvm script" >> "$HOME/.zshrc"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.zshrc
nvm install --lts

# =============== npm global pagkages =============== #
npm_packages=(
  'typescript'
  'ts-node'
  'ngrok'
  'redis-commander'
  'live-server'
  'serve'
  'npm-check-updates'
)

npm install -g ${npm_packages[@]}

# =============== vim-plug =============== #
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# =============== tmux plugins =============== #
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
