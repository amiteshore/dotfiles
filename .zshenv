# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

export LANG="en_US.UTF-8"
export EDITOR="vim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
