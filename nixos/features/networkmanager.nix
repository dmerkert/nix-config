{
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  environment = {
    persistence = {
      "/persist".directories = [
        "/etc/NetworkManager"
      ];
    };
  };
}
