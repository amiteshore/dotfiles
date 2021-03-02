# =============== Auto-completion =============== #
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format 'No matches for: %d'
# Auto-complete with case-insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
compinit
# Include hidden files
_comp_options+=(globdots)

# =============== Prompt =============== #
fpath+=$HOME/.zsh/pure
autoload -Uz promptinit; promptinit
zstyle :prompt:pure:path color '#969696'
zstyle ':prompt:pure:prompt:success' color cyan
zstyle ':prompt:pure:prompt:error' color red
prompt pure

# =============== History config =============== #
HISTFILE=~/.histfile        # Where to save history to disk
HISTSIZE=1000               # How many lines of history to keep in memory
SAVEHIST=5000               # Number of history entries to save to disk
setopt hist_ignore_dups     # Ignore duplicated commands history list
setopt sharehistory         # Share history across terminals
setopt incappendhistory     # Immediately append to the history file, not just when a term is killed

# =============== Misc =============== #
# Persistent rehash
zstyle ':completion:*' rehash true

# Set `vi` mode
bindkey -v

# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# =============== Plugins =============== #
# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10' # Change foreground color

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down