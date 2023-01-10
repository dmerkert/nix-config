{
  programs.password-store = {
    enable = true;
    settings = { PASSWORD_STORE_DIR = "$HOME/.password-store"; };
  };

  services.password-store-sync.enable = true;
}
