# Load environment variables
[[ -f ~/.exports ]] && . ~/.exports

# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
