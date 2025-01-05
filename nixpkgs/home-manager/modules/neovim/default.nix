{ pkgs, pkgsUnstable, lib, ps, ... }:

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

    package = pkgsUnstable.neovim-unwrapped;

    extraPackages = with pkgs; [
      pkgsUnstable.tree-sitter

      # nix
      nil
      nixpkgs-fmt

      # golang
      golangci-lint
      golangci-lint-langserver
      pkgsUnstable.gopls

      # nodejs
      nodePackages.typescript
      nodePackages.typescript-language-server

      # puthon
      pyright

      # lua
      lua-language-server

      # terraform
      pkgsUnstable.terraform-ls

      # writing
      marksman

      # k8s
      helm-ls
    ];
    plugins = with pkgs.vimPlugins; [
      (plugin "szw/vim-maximizer" "master" "2e54952fe91e140a2e69f35f22131219fcd9c5f1")
      (plugin "ernestre/git-worktree.nvim" "master" "36cba883129e0fe02cf046fd30c87c962b2ab957")
      neogit

      pkgsUnstable.vimPlugins.vim-just

      # luasnip {{
      luasnip
      cmp_luasnip
      friendly-snippets
      # }}

      harpoon

      indent-blankline-nvim
      vim-polyglot
      phpactor
      go-nvim
      cmp-buffer
      cmp-calc
      cmp-nvim-lsp
      cmp-path
      comment-nvim
      committia-vim
      gitsigns-nvim
      gv-vim
      impatient-nvim
      tabular
      lspkind-nvim
      vim-polyglot
      lualine-nvim
      mkdir-nvim
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua

      # writing  {{
      markdown-preview-nvim
      vim-pencil
      vimwiki
      bullets-vim
      (plugin "MeanderingProgrammer/render-markdown.nvim" "main" "fe1002fddc61207e4ef4325d4bc0ca33697bbc7a")
      # }}

      # breadcrumbs
      barbecue-nvim
      nvim-navic

      # dap {{
      nvim-dap
      nvim-dap-go
      nvim-dap-ui
      nvim-dap-virtual-text
      telescope-dap-nvim
      # }}

      nvim-lspconfig
      oil-nvim
      nvim-web-devicons
      plenary-nvim
      popup-nvim
      sonokai
      symbols-outline-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      undotree
      vim-fugitive
      vim-repeat
      vim-surround
      # (plugin "sindrets/diffview.nvim" "main" "4516612fe98ff56ae0415a259ff6361a89419b0a")
      diffview-nvim
      gitlinker-nvim
      telescope-fzy-native-nvim
      vim-tmux-navigator

      catppuccin-nvim
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: [
        plugins.tree-sitter-bash
        plugins.tree-sitter-go
        plugins.tree-sitter-hcl
        plugins.tree-sitter-javascript
        plugins.tree-sitter-jsdoc
        plugins.tree-sitter-json
        plugins.tree-sitter-lua
        plugins.tree-sitter-markdown
        plugins.tree-sitter-markdown-inline
        plugins.tree-sitter-nix
        plugins.tree-sitter-php
        plugins.tree-sitter-regex
        plugins.tree-sitter-typescript
        plugins.tree-sitter-yaml
      ]))
    ];
  };
}
