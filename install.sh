#!/usr/bin/bash

# Activate binary cache
nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use nix-community

# Copy dotfiles
git clone https://github.com/poztit/dotfiles.git $HOME/.dotfiles
stow --dir $HOEM/.dotfiles -S home-manager emacs

# Install dotfiles
nix run home-manager switch

# Disable the GNOME Keyring ssh agent
mkdir -p $HOME/.config/autostart
cp /etc/xdg/autostart/gnome-keyring-ssh.desktop ~/.config/autostart/
echo "Hidden=true" >> $HOME/.config/autostart/gnome-keyring-ssh.desktop

# Alert about chshing to zsh
echo "To use ZSH you need to install it and change your default shell with `chsh -s /usr/bin/zsh`"
