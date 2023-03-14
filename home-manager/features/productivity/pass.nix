{
  programs.password-store = {
    enable = true;
    settings = { PASSWORD_STORE_DIR = "$HOME/.password-store"; };
  };

  home.persistence = {
    "/persist/home/user".directories = [
      ".password-store"
    ];
  };
}
