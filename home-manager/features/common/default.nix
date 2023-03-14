{inputs, ...}:
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./git.nix
    ./nvim.nix
    ./zsh.nix
    ./ssh.nix
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "22.11";

    persistence = {
      "/persist/home/user" = {
        directories = [
          "Documents"
          "Desktop"
          "Downloads"
          "Music"
          "Pictures"
          "coding"
          ".config/lxqt"
        ];
        allowOther = true;
      };
    };
  };

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };


}
