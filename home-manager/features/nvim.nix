{pkgs, ...}:

{
  home.packages = [ pkgs.ripgrep ];
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    #defaultEditor = true;
    extraConfig = ''
      set number
      let mapleader = " "
    '';
    plugins = with pkgs.vimPlugins; [
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

}
