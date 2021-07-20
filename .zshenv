# Load environment variables
[[ -f ~/.exports ]] && . ~/.exports

# Load functions
[[ -f ~/.functions ]] && . ~/.functions

# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
