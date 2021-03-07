#!/usr/bin/zsh

GTK3_CONFIG=".config/gtk-3.0/settings.ini"

#     SOURCE                                DESTINATION
ln -s $HOME/dotfiles/.aliases               $HOME/.aliases
ln -s $HOME/dotfiles/.gvimrc                $HOME/.gvimrc
ln -s $HOME/dotfiles/.vimrc                 $HOME/.vimrc
ln -s $HOME/dotfiles/.xinitrc               $HOME/.xinitrc
ln -s $HOME/dotfiles/.zprofile              $HOME/.zprofile
ln -s $HOME/dotfiles/.zshenv                $HOME/.zshenv
ln -s $HOME/dotfiles/.zshrc                 $HOME/.zshrc
ln -s $HOME/dotfiles/.gtkrc-2.0             $HOME/.gtkrc-2.0
ln -s $HOME/dotfiles/$GTK3_CONFIG           $HOME/$GTK3_CONFIG

ln -s $HOME/dotfiles/.config/alacritty      $HOME/.config/alacritty
ln -s $HOME/dotfiles/.config/Code/User      $HOME/.config/Code/User
ln -s $HOME/dotfiles/.config/i3             $HOME/.config/i3
ln -s $HOME/dotfiles/.config/i3status       $HOME/.config/i3status
ln -s $HOME/dotfiles/.config/neofetch       $HOME/.config/neofetch

ln -s $HOME/dotfiles/.vim/autoload          $HOME/.vim/autoload
ln -s $HOME/dotfiles/.vim/colors            $HOME/.vim/colors

cp $HOME/dotfiles/.gitconfig $HOME/.gitconfig
