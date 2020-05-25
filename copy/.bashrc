# ~/.bashrc: executed by bash for non-login shells.

# load the shell dotfiles
for file in ~/.{aliases,functions}; do
				[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PATH=/snap/bin:$PATH

