# How to deploy NixOS

## Intel / AMD

### Preparations

* Download the appropriate ISO file from https://nixos.org/download.html#nixos-iso, e.g. via
```Shell
  wget https://channels.nixos.org/nixos-22.11/latest-nixos-gnome-x86_64-linux.iso -O nixos.iso
```

* Write the ISO file to an empty USB stick `sudo cp nixos.iso /dev/sdb`

* Boot from the USB device

* Install NixOS as intended on the target system. The **user name** must be `user`!

### Prepare NixOS

Edit the configuration `sudo nano /etc/nixos/configuration.nix`, replace
```
  # vim
  # wget
```
by
```
  vim
  git
  wget
```
and apply the configuration with `sudo nixos-rebuild switch`

### Copy / generate keys

* Generate user ssh key
```Shell
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -P ""
```

* Register the generated ssh key with Github for the repository https://github.com/dmerkert/nix-config

* Generate age-keys for nix-sops
```
  mkdir -p ~/.config/sops/age
  nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```
