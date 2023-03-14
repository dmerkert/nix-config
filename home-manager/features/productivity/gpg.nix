{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "46315D8931B1F066263B67E08B83264116A57B5F";
    };
  };

  home.persistence = {
    "/persist/home/user".directories = [
      ".gnupg"
    ];
  };
}
