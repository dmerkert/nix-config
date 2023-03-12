{config, ...}:
{
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    flake = "github:dmerkert/nix-config#${config.networking.hostName}";
  };
} 
