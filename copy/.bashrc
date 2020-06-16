# ~/.bashrc: executed by bash for non-login shells.

# load the shell dotfiles
for file in ~/.{aliases,functions,colors}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;