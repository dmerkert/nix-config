{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
      vim
      wget
      tmux
      git
      home-manager
    ];
}
