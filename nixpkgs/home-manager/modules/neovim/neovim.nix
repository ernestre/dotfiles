{ pkgs, lib, ... }:

let
  plugin = repo: rev: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = rev;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = "master";
      rev = rev;
    };
  };
in {
  home.file.".vimrc".source = ./.vimrc;
  home.file.".vim".source = ./vim;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    extraConfig = builtins.readFile ./init.vim;

    extraPackages = with pkgs; [
      tree-sitter
      nodePackages.typescript nodePackages.typescript-language-server
      gopls
      golangci-lint-langserver
    ];
    plugins = with pkgs.vimPlugins; [
        cmp-buffer
        (plugin "ray-x/go.nvim" "c75824b1f050c153ebfd5be65a318b9d4463d5a9")
        (plugin "ThePrimeagen/harpoon" "f4aff5bf9b512f5a85fe20eb1dcf4a87e512d971")
        (plugin "szw/vim-maximizer" "2e54952fe91e140a2e69f35f22131219fcd9c5f1")
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
        indent-blankline-nvim
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
  };
}
