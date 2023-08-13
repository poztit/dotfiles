# Install

Install `curl`, `git`, `stow`, `zsh`, and `nix` :
```bash
sudo apt update && sudo apt install curl git stow zsh --yes && sh <(curl -L https://nixos.org/nix/install) && mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf && . /home/fillien/.nix-profile/etc/profile.d/nix.sh && wget -O - https://raw.githubusercontent.com/poztit/dotfiles/master/install.sh | bash
```

Logout and login again to finish Nix install.

Install the dotfiles :
```bash
wget -O - https://raw.githubusercontent.com/poztit/dotfiles/master/install.sh | bash
```

