#!/usr/bin/zsh

# Create directories, if doesn't exists.
mkdir -vp $HOME/Downloads/AUR
mkdir -vp $HOME/Documents
mkdir -vp $HOME/Pictures
mkdir -vp $HOME/Temporary

mkdir -vp $HOME/projects/dev
mkdir -vp $HOME/projects/temp

mkdir -vp $HOME/.zsh
mkdir -vp "$HOME/.config/Code - OSS"

# Copy files and directories

#         SOURCE                                DESTINATION
cp  -v    $HOME/dotfiles/.aliases               $HOME/
cp  -v    $HOME/dotfiles/.exports               $HOME/
cp  -v    $HOME/dotfiles/.functions             $HOME/
cp  -v    $HOME/dotfiles/.gitconfig             $HOME/
cp  -v    $HOME/dotfiles/.gtkrc-2.0             $HOME/
cp  -v    $HOME/dotfiles/.tmux.conf             $HOME/
cp  -v    $HOME/dotfiles/.xinitrc               $HOME/
cp  -v    $HOME/dotfiles/.zprofile              $HOME/
cp  -v    $HOME/dotfiles/.zshenv                $HOME/
cp  -v    $HOME/dotfiles/.zshrc                 $HOME/

cp  -vr   $HOME/dotfiles/.config/gtk-3.0        $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/nvim           $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/alacritty      $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/i3             $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/i3status       $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/neofetch       $HOME/.config/
cp  -vr   $HOME/dotfiles/.config/rofi           $HOME/.config/
cp  -vr   "$HOME/dotfiles/.config/Code - OSS/User"      "$HOME/.config/Code - OSS/"

cp  -vr   $HOME/dotfiles/bin                    $HOME/
cp  -vr   $HOME/dotfiles/.wallpapers            $HOME/Pictures/

# Clone pure prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
