{pkgs, ...}:

let
  # Left in as an example how to add vim plugins from Github directly
#  notmuch-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
#    name = "notmuch-vim";
#    src = pkgs.fetchFromGitHub {
#      owner = "felipec";
#      repo = "notmuch-vim";
#      rev = "971c6626caa2ef51963bc5d67a3782e30b1f5824";
#      #sha256 = "0000000000000000000000000000000000000000000000000000";
#      sha256 = "fjXq15ORSEbUkPLjOlYPWnZ7aSDYe+XDmPn5GXnEP0M=";
#    };
#  };
in
{
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    #withRuby = true; #Required for notmuch-vim
    extraConfig = ''
      set number
      let mapleader = " "
    '';
    plugins = with pkgs.vimPlugins; [
      #notmuch-vim
      vim-nix
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      {
        plugin = nvim-treesitter;
        type = "lua";
        #bugfix see https://github.com/NixOS/nixpkgs/issues/189838 
        config = ''
          local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
          vim.fn.mkdir(parser_install_dir, "p")
          vim.opt.runtimepath:append(parser_install_dir)

          require('nvim-treesitter.configs').setup {
          parser_install_dir = parser_install_dir,
          ensure_installed = { "lua", "elixir", "css", "dockerfile", "html", "markdown" },
          sync_install = true,
          ignore_install = { },
          highlight = {
          enable = true,
          disable = { },
          },
          indent = {
          enable = true
          }
          }
        '';
      }
      vim-fugitive
      #mix-test
      #{
      #  plugin = neodark-vim;
      #  type = "lua";
      #  config = ''
      #    require "plugins.colorscheme",
      #    as = "colorscheme"
      #  '';
      #}
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = ''
            require("nvim-autopairs").setup {}
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          require("telescope").setup {}
          vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})
          vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, {})
        '';
      }
      telescope-fzf-native-nvim
      lsp_signature-nvim
      lspkind-nvim
 # use { 
 #         'dkuku/vim-projectionist-elixir',
 #         requires = {
 #                 { 'c-brenn/fuzzy-projectionist.vim' },
 #                 {'tpope/vim-projectionist'}
 #         }
 # }


    ];
  };

  #required by telescope-nvim
  home.packages = [ pkgs.ripgrep pkgs.gcc ];
}
