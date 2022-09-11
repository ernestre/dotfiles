{ config, pkgs, lib, ... }:

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
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "erre";
  home.homeDirectory = "/home/erre";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # home.sessionVariables = {
  #   EDITOR = "nvim";
  #   LANG = "en_US.UTF-8";
  #   LC_ALL = "en_US.UTF-8";
  #   LC_CTYPE = "en_US.UTF-8";
  #   PULUMI_K8S_SUPPRESS_HELM_HOOK_WARNINGS = "true";
  # };

  home.packages = with pkgs; [
    git
    pass
    tmux
    fzf
    fd
    ripgrep
    tree
    go
  ];

  programs.bottom.enable = true;
  programs.bat.enable = true;

  programs.git = {
    delta = { enable = true; };

    enable = true;
    userEmail = "ernest.rekel@gmail.com";
    userName = "Ernest Rekel";

    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      diff.colorMoved = "zebra";
      fetch.prune = true;
      github.user = "ernestre";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "tracking";
      rebase.autoStash = true;
    };
  };


  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;

    extraConfig = ''
        set runtimepath^=~/.vim runtimepath+=~/.vim/after
        let &packpath=&runtimepath
        source ~/.vimrc
    '';
    extraPackages = with pkgs; [
      # used to compile tree-sitter grammar
      tree-sitter

      # installs different langauge servers for neovim-lsp
      # have a look on the link below to figure out the ones for your languages
      # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
      nodePackages.typescript nodePackages.typescript-language-server
      gopls
    ];
    plugins = with pkgs.vimPlugins; [
        cmp-buffer
        (plugin "ray-x/go.nvim")
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
          plugins.tree-sitter-json
          plugins.tree-sitter-javascript
          plugins.tree-sitter-jsdoc
          plugins.tree-sitter-typescript
          plugins.tree-sitter-php
          plugins.tree-sitter-hcl
          plugins.tree-sitter-nix
        ]))
    ];
  };

  programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;

      oh-my-zsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "cloud";
      };

      shellAliases = {
          cat = "bat --paging=never --theme='base16'";
          fetch = "git fetch --all --jobs=4 --progress --prune";
          pull = "git pull --autostash --ff --no-rebase --squash --summary origin";
          rebase = "git rebase --autostash --merge --stat";
          ssh = "TERM='xterm-256color' ssh";
          gs = "git status";
          gac = "git add . && git commit -v";
          guc = "git add -u && git commit -v";
          gaca = "git add . && git commit -v --amend";
          gacan = "gaca --no-edit";
      };

      sessionVariables = {
          EDITOR = "nvim";
          LANG = "en_US.UTF-8";
          LC_ALL = "en_US.UTF-8";
          LC_CTYPE = "en_US.UTF-8";
      };
  };
}
