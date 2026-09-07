# =============== Completion =============== #

FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"

autoload -Uz compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true

_comp_options+=(globdots)

if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m+1) ]]; then
  compinit
else
  compinit -C
fi


# =============== History =============== #

HISTSIZE=10000000
SAVEHIST=10000000

setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups


# =============== Keybindings =============== #

bindkey -v

bindkey '^[[C' backward-word
bindkey '^[[D' forward-word

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -s '^F' "cdd\n"
bindkey -s '^E' "conf\n"
bindkey -s '^O' "open_file\n"


# =============== Aliases / Functions =============== #

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"


# =============== PATH =============== #

[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


# =============== fnm =============== #

eval "$(fnm env --use-on-cd --shell zsh)"


# =============== fzf =============== #

source <(fzf --zsh)


# =============== zoxide =============== #

eval "$(zoxide init zsh)"


# =============== Java =============== #

export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="$JAVA_HOME/bin:$PATH"


# =============== Android =============== #

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"


# =============== Antigravity IDE =============== #

export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"


# =============== Zsh plugins =============== #

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# =============== Starship =============== #

eval "$(starship init zsh)"
