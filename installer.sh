# 🚀 Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask kitty
brew install --cask google-chrome
brew install --cask android-studio
brew install --cask antigravity-ide

brew install tmux
brew install starship
brew install openjdk@17
brew install bat
brew install eza
brew install tree
brew install fzf

brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash

nvm install --lts
nvm use --lts

corepack enable pnpm
