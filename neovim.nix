{ pkgs, lib, ... }:

let
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
    enable = true;
    vimAlias = true;
    withNodeJs = true;

    extraConfig = ''
        set runtimepath^=~/.vim runtimepath+=~/.vim/after
        let &packpath=&runtimepath
        source ~/.vimrc
    '';
    extraPackages = with pkgs; [
      tree-sitter
      nodePackages.typescript nodePackages.typescript-language-server
      gopls
    ];
    plugins = with pkgs.vimPlugins; [
        cmp-buffer
        (plugin "ray-x/go.nvim")
        (plugin "ThePrimeagen/harpoon")
        cmp-calc
        cmp-nvim-lsp
        cmp-nvim-ultisnips
        cmp-path
        comment-nvim
        committia-vim
        gitsigns-nvim
        gv-vim
        hop-nvim
        lspkind-nvim
        lualine-nvim
        markdown-preview-nvim
        mkdir-nvim
        nvim-autopairs
        nvim-cmp
        nvim-colorizer-lua
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text
        nvim-lspconfig
        nvim-tree-lua
        nvim-web-devicons
        plenary-nvim
        popup-nvim
        quick-scope
        sonokai
        symbols-outline-nvim
        telescope-dap-nvim
        telescope-fzf-native-nvim
        telescope-nvim
        ultisnips
        undotree
        vim-fugitive
        vim-repeat
        vim-snippets
        vim-surround
        vim-test
        vimwiki
        (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: [
          plugins.tree-sitter-go
          plugins.tree-sitter-hcl
          plugins.tree-sitter-javascript
          plugins.tree-sitter-jsdoc
          plugins.tree-sitter-json
          plugins.tree-sitter-nix
          plugins.tree-sitter-php
          plugins.tree-sitter-typescript
        ]))
    ];
  }
