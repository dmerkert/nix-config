{ lib, inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.impermanence.nixosModules.impermanence

    ./account.nix
    ./ssh.nix
    ./basics.nix
    ./sops.nix
    ./security.nix
    ./nix.nix
    ./autoupgrade.nix
    ./locale.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  hardware.enableRedistributableFirmware = true;

  #needed for impermanence
  programs.fuse.userAllowOther = true;

  environment = {
    persistence = {
      "/persist".directories = [
        "/var/lib/systemd"
        "/var/log"
        "/srv"
      ];
    };
  };
}
