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
HISTSIZE=10000000             # Number of lines of history kept within the shell
HISTFILE=~/.histfile          # File where history is saved
SAVEHIST=10000000             # Number of lines of history to save to $HISTFILE

setopt share_history          # Share history across terminals
setopt inc_append_history     # Immediately append to the history file, not just when a term is killed
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_dups       # Don't record an entry that was just recorded again
setopt hist_ignore_space      # Don't record an entry starting with a space
setopt hist_save_no_dups      # Don't write duplicate entries in the history file.

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

bindkey -s ^F "cdd\n"
bindkey -s ^E "conf\n"
bindkey -s ^\` "open_file\n"

# =============== Misc =============== #
# Set `vi` mode
bindkey -v

# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# =============== Starship prompt =============== #
eval "$(starship init zsh)"
