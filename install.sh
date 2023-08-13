#!/usr/bin/sh

sudo apt-get install curl

# Install Nix
curl -L https://nixos.org/nix/install -o install.sh
sh install.sh

# Enable flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
