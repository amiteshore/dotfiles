# ~/.profile: executed by the command interpreter for login shells.

if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi