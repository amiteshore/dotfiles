#
# ~/.zshrc
#

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Timestamp shown in the history command output
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/zsh/custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# Change zsh-autosuggestions foreground color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'