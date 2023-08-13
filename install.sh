#!/usr/bin/bash

# Install Nix
curl -L https://nixos.org/nix/install -o install.sh
curl -L https://github.com/poztit/dotfiles/archive/refs/heads/master.zip -o master.zip
unzip master.zip

stow --dir master -S home-manager emacs

nix run home-manager/master -- init --switch ~/.config/home-manager/flake.nix

home-manager switch --flake ~/.config/home-manager/flake.nix 
