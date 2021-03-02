# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"

# Make vim the default editor
export EDITOR="vim"

# Use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
