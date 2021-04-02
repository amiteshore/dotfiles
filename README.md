# Dotfiles

Dotfiles, built for Arch Linux.

### What's inside?

<table>
  <tr>
    <th>Shell</th>
    <td>zsh</td>
  </tr>
  <tr>
    <th>Terminal</th>
    <td>alacritty</td>
  </tr>
  <tr>
    <th>Editor</th>
    <td>vim</td>
  </tr>
  <tr>
    <th>WM</th>
    <td>i3-gaps</td>
  </tr>
  <tr>
    <th>Monitor</th>
    <td>htop</td>
  </tr>
  <tr>
    <th>File Manager</th>
    <td>ranger</td>
  </tr>
</table>

### Installation

A base installation of Arch Linux is required for this setup to work.

`git` is required for cloning this repository.

Run this:

```sh
git clone https://github.com/amiteshore/dotfiles.git "$HOME/dotfiles"
cd $HOME/dotfiles
./bootstrap.sh
```

This will make some directories (see [bootstrap.sh](https://github.com/amiteshore/dotfiles/blob/master/bootstrap.sh)) in your home folder, install some packages (see [installer1.sh](https://github.com/amiteshore/dotfiles/blob/master/installer1.sh) and [installer2.sh](https://github.com/amiteshore/dotfiles/blob/master/installer2.sh)) and create symlinks (see [sync.sh](https://github.com/amiteshore/dotfiles/blob/master/sync.sh)) from this repo to your home directory.

Note: Some changes may require a quick restart.
