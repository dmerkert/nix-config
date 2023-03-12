{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    tmux
    git
    home-manager
    htop
  ];

  environment.variables.EDITOR = "nvim";
}
