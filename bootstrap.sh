#!/bin/bash

# Copy .files to $HOME`
rsync -avh --no-perms ./copy/ ~/;

# Copy .vim directory to `$HOME`
rsync -avh --no-perms ./.vim ~/;

# Copy sensible vscode configs to vscode's user config direcotry
rsync -avh ./vscode/ ~/.config/Code/User/;
