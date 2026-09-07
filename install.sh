#!/bin/bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Starting macOS setup..."

# --------------------------------------------------
# Homebrew
# --------------------------------------------------

echo "🍺 Installing Homebrew..."

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
else
    echo "❌ Homebrew installation failed."
    exit 1
fi


# --------------------------------------------------
# Homebrew packages
# --------------------------------------------------

echo "📦 Installing Homebrew packages..."

brew bundle --file="$DOTFILES/Brewfile"


# --------------------------------------------------
# NVM
# --------------------------------------------------

echo "🟢 Installing NVM..."

export NVM_DIR="$HOME/.nvm"

if [[ ! -d "$NVM_DIR" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash
fi

# Load NVM into current shell
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
fi

nvm install --lts
nvm alias default 'lts/*'


# --------------------------------------------------
# pnpm
# --------------------------------------------------

echo "📦 Setting up pnpm..."

corepack enable
corepack prepare pnpm@latest --activate


# --------------------------------------------------
# Symlink dotfiles
# --------------------------------------------------

echo "🔗 Linking dotfiles..."

# Shell
ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.aliases" "$HOME/.aliases"
ln -sf "$DOTFILES/.functions" "$HOME/.functions"

# Git / terminal
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Scripts
ln -sfn "$DOTFILES/bin" "$HOME/bin"

# Config
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/.config/kitty" "$HOME/.config/kitty"
ln -sf "$DOTFILES/.config/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/Library/Application Support/Antigravity IDE/User"

ln -sf \
  "$DOTFILES/apps/antigravity/settings.json" \
  "$HOME/Library/Application Support/Antigravity IDE/User/settings.json"

# --------------------------------------------------
# tmux plugins
# --------------------------------------------------

echo "🔌 Installing tmux plugins..."

mkdir -p "$HOME/.tmux/plugins"

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone \
        https://github.com/tmux-plugins/tpm \
        "$HOME/.tmux/plugins/tpm"
fi

# Install plugins declared in .tmux.conf
"$HOME/.tmux/plugins/tpm/bin/install_plugins"
