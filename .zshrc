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
SAVEHIST=10000000             # Number of lines of history to save to $HISTFILE

setopt share_history          # Share history across terminals
setopt inc_append_history     # Immediately append to the history file, not just when a term is killed
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_dups       # Don't record an entry that was just recorded again
setopt hist_ignore_space      # Don't record an entry starting with a space
setopt hist_save_no_dups      # Don't write duplicate entries in the history file.

# Set `vi` mode
bindkey -v

# =============== Keybindings =============== #
bindkey '^[[C'   backward-word         # ctrl+←
bindkey '^[[D'   forward-word          # ctrl+→
#bindkey '^[[1;6D'   beginning-of-line     # ctrl+shift+←
#bindkey '^[[1;6C'   end-of-line           # ctrl+shift+→
#bindkey '^H'        backward-delete-word  # ctrl+backspace

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -s ^F "cdd\n"           # ctrl + f
bindkey -s ^E "conf\n"          # ctrl + e
bindkey -s ^G "open_file\n"     # ctrl + g

# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# Load functions
[[ -f ~/.functions ]] && . ~/.functions

# Set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/amit/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# java
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

if /usr/libexec/java_home -V >/dev/null 2>&1; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 17)
fi

export PATH="$HOME/.local/bin:$PATH"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
autoload -Uz compinit && compinit

# Added by Antigravity IDE
export PATH="/Users/amit/.antigravity-ide/antigravity-ide/bin:$PATH"

# must be at the end of the file
eval "$(starship init zsh)"export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"