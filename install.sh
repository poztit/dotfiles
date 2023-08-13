#!/usr/bin/sh

# Install Nix
curl -L https://nixos.org/nix/install -o install.sh
sh install.sh

# Enable flakes
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
