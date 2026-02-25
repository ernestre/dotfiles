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
      indent-blankline-nvim
      neogit

      # (
      #   let
      #     url = "https://github.com/harrisoncramer/gitlab.nvim";
      #     ref = "main";
      #     rev = "35f0bc16a5bbcb3df8415b96605e7142293be5d0";
      #
      #     gitlabBin = pkgs.buildGoModule {
      #       pname = "gitlab-bin.nvim";
      #       version = "1.1.3";
      #       src = builtins.fetchGit {
      #         inherit url ref rev;
      #
      #       };
      #       vendorHash = "sha256-FjiG5XYd5VviZgMzgB//qzDvoLy4sJVb6A88Z0aEdbo=";
      #     };
      #
      #   in
      #   pkgs.vimUtils.buildVimPlugin {
      #     pname = "gitlab.nvim";
      #     version = rev;
      #     buildInputs = [ gitlabBin ];
      #     postInstall = ''
      #       cp ${gitlabBin}/bin/cmd $out/bin
      #     '';
      #     src = builtins.fetchGit {
      #       inherit url ref rev;
      #     };
      #   }
      # )
      nui-nvim

      pkgsUnstable.vimPlugins.vim-just

      harpoon
      vim-polyglot
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

      # neotest{{
      FixCursorHold-nvim
      nvim-nio
      neotest
      neotest-golang
      #}}

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
      oil-nvim
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
      diffview-nvim
      gitlinker-nvim
      telescope-fzy-native-nvim
      vim-tmux-navigator
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
        plugins.tree-sitter-regex
        plugins.tree-sitter-typescript
        plugins.tree-sitter-yaml
      ]))
    ];
  };
}
