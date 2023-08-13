#!/usr/bin/bash

# Activate binary cache
nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use nix-community

# Copy dotfiles
curl -L https://github.com/poztit/dotfiles/archive/refs/heads/master.zip -o master.zip
unzip master.zip dotfiles-master -d $HOME/.dotfiles && rm -rf master.zip
stow --dir .dotfiles -S home-manager emacs

# Install dotfiles
nix run home-manager switch

# Disable the GNOME Keyring ssh agent
mkdir -p $HOME/.config/autostart
cp /etc/xdg/autostart/gnome-keyring-ssh.desktop ~/.config/autostart/
echo "Hidden=true" >> $HOME/.config/autostart/gnome-keyring-ssh.desktop

# Alert about chshing to zsh
echo "To use ZSH you need to install it and change your default shell with `chsh -s /usr/bin/zsh`"
