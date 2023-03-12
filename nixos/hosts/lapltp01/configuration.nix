{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../../common
    ../../features/windowmanager.nix
    #../../features/wifi.nix
    ../../features/networkmanager.nix
    ../../features/tailscale.nix
    ../../features/ntfs.nix

    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t410
    #Use if T410-specific module does not work
    #inputs.nixos-hardware.nixosModules.common-cpu-intel
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.modifications
      outputs.overlays.additions
    ];
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  networking.hostName = "lapltp01";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  boot.loader.grub = {
	  enable = true;
	  devices = [ "/dev/sda" ];
    version = 2;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
