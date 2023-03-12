{pkgs, config, lib, outputs, ...}:
{
  users.mutableUsers = false;

  users.users.user = {
    isNormalUser = true;
    passwordFile = config.sops.secrets.password_user.path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMHQEPraQvNWTlvZ5ytAZ7ZuHb0kSRuqjy06G8aJau6u"
    ];
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = [ pkgs.home-manager ];
  };

  sops.secrets.password_user = {
    sopsFile = ../../secrets/common.yaml;
    neededForUsers = true;
  };

  home-manager.users.user = import home/${config.networking.hostName}.nix;

}
