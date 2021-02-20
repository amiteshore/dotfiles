#
# ~/.zshenv
#

# Path to your oh-my-zsh installation.
export ZSH="/home/amit/.oh-my-zsh"

# Auto-update (in days)
export UPDATE_ZSH_DAYS=7

# Language environment
export LANG="en_US.UTF-8"

# Preferred editor 
export EDITOR="vim"

# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"