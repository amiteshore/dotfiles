# Dotfiles

Dotfiles, built for Arch Linux.

### What's inside?

<table>
  <tr>
    <th>WM</th>
    <td>i3</td>
  </tr>
  <tr>
    <th>Terminal</th>
    <td>alacritty</td>
  </tr>
  <tr>
    <th>Shell</th>
    <td>zsh</td>
  </tr>
  <tr>
    <th>Multiplexer</th>
    <td>tmux</td>
  </tr>
  <tr>
    <th>Editor</th>
    <td>neovim</td>
  </tr>
</table>

### Requirements

- git
- zsh

### Installation

A base installation of Arch Linux with a non-root `sudo` enabled user account is required for this setup to work.

> Tip: Enable `ParallelDownloads` under `[Options]` in `/etc/pacman.conf` for faster downloading of packages.

> Remove packages from [installer.sh](https://github.com/amiteshore/dotfiles/blob/master/installer.sh) that you don't need.

Run this:

```sh
git clone https://github.com/amiteshore/dotfiles.git "~/dotfiles"
cd ~/dotfiles
./bootstrap.sh
./installer.sh
```

Note: Some changes may require a quick reboot.

### Post-installation

Install vim plugins. Run `:PackerInstall` inside nvim, ignore the errors after opening nvim for the first time.

Edit `~/.gitconfig`.

Generate SSH keys.

Setup firewall.

Pair and trust the bluetooth headphone MAC address with `bluetoothctl`, then add the MAC address on `$HEADPHONE_MAC_ADDRESS` variable in `~/.exports`.

#### Docker

Add user to docker group

```sh
sudo groupadd docker
sudo usermod -aG docker <username>
```

Start `docker.service` and check if I can run `docker` commands without root user (may need to reboot).
