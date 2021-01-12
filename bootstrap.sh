#!/bin/bash

# Copy .files to $HOME`
rsync -avh --no-perms ./copy/ ~/;

# Copy sensible vscode configs to vscode's user config direcotry
rsync -avh ./vscode/ ~/.config/Code/User/;
