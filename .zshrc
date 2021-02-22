#
# .zshrc
#

## AUTO-COMPLETETION
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format 'No matches for: %d'
# auto-complete with case-insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
compinit
# include hidden files
_comp_options+=(globdots)

## PROMPT
# add the path of the `sindresorhus/pure` repo to $fpath
fpath+=$HOME/.zsh/pure
# load promptinit
autoload -Uz promptinit; promptinit
# change the `path` color of pure
zstyle :prompt:pure:path color '#969696'
# change the `prompt:success` color of pure
zstyle ':prompt:pure:prompt:success' color cyan
# change the `prompt:error` color of pure
zstyle ':prompt:pure:prompt:error' color red
# set the default prompt to the `pure` theme
prompt pure

## HISTORY CONFIG
HISTFILE=~/.histfile        # where to save history to disk
HISTSIZE=1000               # how many lines of history to keep in memory
SAVEHIST=5000               # number of history entries to save to disk
setopt hist_ignore_dups     # ignore duplicated commands history list
setopt sharehistory         # share history across terminals
setopt incappendhistory     # immediately append to the history file, not just when a term is killed

## GENERAL

# persistent rehash
zstyle ':completion:*' rehash true

# set `vi` mode
bindkey -v

# load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# PLUGINS

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10' # change foreground color

# syntax-highlighting; should be last plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
