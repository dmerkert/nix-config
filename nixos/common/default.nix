{ lib, inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./account.nix
    ./ssh.nix
    ./basics.nix
    ./sops.nix
    ./security.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  hardware.enableRedistributableFirmware = true;
}
