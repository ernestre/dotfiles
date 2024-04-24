{ pkgs, pkgsUnstable, lib, ... }:

let
  plugin = repo: ref: rev: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = rev;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      inherit ref rev;
    };
  };
in
{
  home.file.".config/nvim".source = ./config/nvim;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      tree-sitter

      # nix
      nil
      nixpkgs-fmt

      # golang
      golangci-lint
      golangci-lint-langserver
      gopls

      # nodejs
      nodePackages.typescript
      nodePackages.typescript-language-server

      # puthon
      nodePackages.pyright

      # lua
      lua-language-server

      # terraform
      terraform-ls
    ];
    plugins = with pkgs.vimPlugins; [
      (plugin "szw/vim-maximizer" "master" "2e54952fe91e140a2e69f35f22131219fcd9c5f1")
      (plugin "sniphpets/sniphpets" "master" "069f4a7818e8fcf50cd669a2651c3f63f9b2e550")
      (plugin "sniphpets/sniphpets-common" "master" "a250b732477b4985b3961f0fd4e50aab247f0bae")

      pkgsUnstable.vimPlugins.vim-just

      harpoon
      vim-polyglot
      phpactor
      go-nvim
      cmp-buffer
      cmp-calc
      cmp-nvim-lsp
      cmp-nvim-ultisnips
      cmp-path
      comment-nvim
      committia-vim
      gitsigns-nvim
      gv-vim
      impatient-nvim
      indent-blankline-nvim
      lspkind-nvim
      lualine-nvim
      mkdir-nvim
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      markdown-preview-nvim

      # breadcrumbs
      barbecue-nvim
      nvim-navic

      # dap
      nvim-dap
      nvim-dap-go
      nvim-dap-ui
      nvim-dap-virtual-text
      telescope-dap-nvim

      nvim-lspconfig
      nvim-tree-lua
      nvim-web-devicons
      plenary-nvim
      popup-nvim
      sonokai
      symbols-outline-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      ultisnips
      undotree
      vim-fugitive
      vim-repeat
      vim-snippets
      vim-surround
      vimwiki
      diffview-nvim
      gitlinker-nvim
      telescope-fzy-native-nvim
      vim-tmux-navigator
      lsp_signature-nvim
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: [
        plugins.tree-sitter-go
        plugins.tree-sitter-hcl
        plugins.tree-sitter-javascript
        plugins.tree-sitter-jsdoc
        plugins.tree-sitter-json
        plugins.tree-sitter-nix
        plugins.tree-sitter-php
        plugins.tree-sitter-lua
        plugins.tree-sitter-typescript
      ]))
    ];
  };
}
