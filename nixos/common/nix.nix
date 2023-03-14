{
  nix = {
    settings = {
      auto-optimise-store = true;   
      trusted-users = [ "root" "@wheel" ];
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    '';
}
