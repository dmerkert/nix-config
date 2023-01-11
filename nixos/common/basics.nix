{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    tmux
    git
    home-manager
  ];

  environment.variables.EDITOR = "nvim";
}
