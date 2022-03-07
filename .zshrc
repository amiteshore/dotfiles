# =============== Auto-completion =============== #
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format 'No matches for: %d'
# Auto-complete with case-insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
compinit
# Persistent rehash
zstyle ':completion:*' rehash true
# Include hidden files
_comp_options+=(globdots)

# =============== History config =============== #
HISTFILE=~/.histfile        # Where to save history to disk
HISTSIZE=1000               # How many lines of history to keep in memory
SAVEHIST=5000               # Number of history entries to save to disk
setopt hist_ignore_dups     # Ignore duplicated commands history list
setopt sharehistory         # Share history across terminals
setopt incappendhistory     # Immediately append to the history file, not just when a term is killed

# =============== Plugins =============== #
# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10' # Change foreground color

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# =============== Keybindings =============== #
bindkey '^[[1;5D'   backward-word         # ctrl+←
bindkey '^[[1;5C'   forward-word          # ctrl+→
bindkey '^[[1;6D'   beginning-of-line     # ctrl+shift+←
bindkey '^[[1;6C'   end-of-line           # ctrl+shift+→
bindkey '^H'        backward-delete-word  # ctrl+backspace

# =============== Misc =============== #
# Set `vi` mode
bindkey -v

# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# =============== Starship prompt =============== #
eval "$(starship init zsh)"
