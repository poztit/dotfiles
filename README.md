# Install

Install `curl`, `stow` and `nix` :
```bash
sudo apt update && sudo apt install curl stow
```
```bash
sh <(curl -L https://nixos.org/nix/install)
```

Enable flakes :
```bash
mkdir -p ~/.config/nix
```
```bash
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```

Logout and login again to finish Nix install.

Install the dotfiles :
```bash
wget -O - https://raw.githubusercontent.com/poztit/dotfiles/master/install.sh | bash
```

