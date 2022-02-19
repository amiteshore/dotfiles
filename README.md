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
    <td>neovim</td>
  </tr>
  <tr>
    <th>Multiplexer</th>
    <td>tmux</td>
  </tr>
  <tr>
    <th>WM</th>
    <td>i3</td>
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
./installer.sh
```

Note: The installer will ask for password and permissions (again and again) before installing anything.

Note: Some changes may require a quick reboot.

### Post-installation

Install vim plugins.

Edit `~/.gitignore`.

Generate SSH keys.

#### Docker

Add user to docker group

```sh
sudo groupadd docker
sudo usermod -aG docker <username>
```

Start docker service and check if I can run `docker` commands without root user (may need to reboot).
