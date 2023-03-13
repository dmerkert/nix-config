{
    programs.zsh = {
      enable = true;
      prezto = {
        enable = true;
        tmux.autoStartRemote = true;
        tmux.autoStartLocal = false;
        prompt.theme = "steeef";
        pmodules = ["environment" "utility" "prompt" "syntax-highlighting" "autosuggestions" "tmux" "git" "directory" "completion"];
      };
      shellAliases =  {
        sw_heureka = ''sudo nixos-rebuild switch --flake ".#heureka"'';
        hm_heureka = ''home-manager switch --flake ".#user@heureka"'';
      };
      initExtra = ''
        # Makes git auto completion faster favouring for local completions
        __git_files () {
          _wanted files expl 'local files' _files
        }
      '';
    };
}
