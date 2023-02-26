#!/bin/sh

#################
# Generate Keys #
#################

#Generate SSH-Key
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -P ""

#Derive age-Key from SSH-Key
mkdir -p ~/.config/sops/age
ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt

#Generate Host-Keys
sudo ssh-keygen -A

######################
# Export public keys #
######################

echo "Public ssh-key for user (register at GitHub):" >public_keys.txt
cat ~/.ssh/id_ed25519.pub >>public_keys.txt

echo "Public age-key for user (add to .sops.yaml):" >>public_keys.txt
age-keygen -y ~/.config/sops/age/keys.txt >>public_keys.txt

echo "Public age-key of the machine (add to .sops.yaml):" >>public_keys.txt
cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age >>public_keys.txt

