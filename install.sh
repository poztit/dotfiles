#!/usr/bin/bash

curl -L https://github.com/poztit/dotfiles/archive/refs/heads/master.zip -o master.zip
unzip master.zip

stow --dir dotfiles-master -S home-manager emacs

nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use nix-community
nix run home-manager/master -- init --switch "$HOME/.config/home-manager/flake.nix"
nix run home-manager switch
rm -rf master.zip dotfiles-master
