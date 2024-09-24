#!/usr/bin/zsh

# Install packages from the official arch repo, AUR and other sources

packages=(
  'xorg'              # group
  'base-devel'        # group
  'i3'                # group
  'firefox'
  'firefox-developer-edition'
  'discord'
  'neovim'
  'code'
  'obs-studio'
  'filezilla'
  'gimp'
  'alacritty'
  'kitty'
  'starship'
  'ripgrep'
  'fd'
  'bat'
  # 'exa'
  'eza'
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
  'gvfs'
  'tumbler' # thumbnails for thunar
  'ffmpegthumbnailer' # video thumbnailer for thunar
  'rofi'
  'dunst'
  'xclip'
  'gthumb'
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
  'redis'
  'docker'
  'httpie'
  'nginx'
  'clang'
  'python'
  'python-pip'
  'lua-language-server' # LSP server
  # lamp stack + phpmyadmin
  'apache'
  'mariadb'
  'php'
  'php-apache'
  'php-gd'
  'phpmyadmin'
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
  # for connecting mobile devices via USB
  'mtpfs'
  'gvfs-mtp'
  'gvfs-gphoto2'
)

sudo pacman -S ${packages[@]}

# AUR PACKAGES #

AUR_DIR="$HOME/Downloads/AUR"

# =============== google-chrome =============== #
git clone https://aur.archlinux.org/google-chrome.git "$AUR_DIR/google-chrome"
cd "$AUR_DIR/google-chrome"
makepkg -si
echo

# =============== cursor =============== #
git clone https://aur.archlinux.org/cursor-bin.git "$AUR_DIR/cursor-bin"
cd "$AUR_DIR/cursor-bin"
makepkg -si
echo

# =============== spotify =============== #
git clone https://aur.archlinux.org/spotify.git "$AUR_DIR/spotify"
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --import -
cd $AUR_DIR/spotify
makepkg -si
echo

# =============== nvm & node =============== #
echo "\n" >> "$HOME/.zshrc"
echo -n "# Load nvm script" >> "$HOME/.zshrc"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
nvm install --lts

# =============== npm global pagkages =============== #
npm_packages=(
  'typescript'
  'ts-node'
  'redis-commander'
  'serve'
  'live-server'
  'json-server'
  'npm-check-updates'
  'expo-cli' # React Native development
  'eas-cli' # React Native development
  'typescript-language-server' # LSP server
  '@tailwindcss/language-server' # LSP server
  '@fsouza/prettierd' # prettier, as a daemon, for ludicrous formatting speed.
  'vscode-langservers-extracted' # vscode-langservers bin collection. >> (update lspconfig file) << 
)

npm install -g ${npm_packages[@]}

# =============== packer (neovim plugin manager) =============== #
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# =============== tmux plugins =============== #
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

# =============== rust =============== #
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
echo

# =============== rust crates =============== #
cargo install stylua
