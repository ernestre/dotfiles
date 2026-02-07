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
