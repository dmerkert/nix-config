{
  programs.git = {
    enable = true;
    userName = "Dennis Merkert";
    userEmail = "info@dmerkert.de";
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = [ "result" ];
  };
}
