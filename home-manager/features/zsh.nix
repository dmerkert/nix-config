{
    programs.zsh = {
      enable = true;
      prezto = {
        enable = true;
        tmux.autoStartRemote = true;
        tmux.autoStartLocal = true;
        prompt.theme = "steeef";
        pmodules = ["environment" "utility" "prompt" "syntax-highlighting" "autosuggestions" "tmux" "git" "directory" "completion"];
      };
      shellAliases =  {
        sw_heureka = ''sudo nixos-rebuild switch --flake ".#heureka"'';
        hm_heureka = ''home-manager switch --flake ".#user@heureka"'';
      };
    };
}
