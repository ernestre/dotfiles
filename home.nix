{ config, pkgs, lib, ... }:

let
  vimsettings = import ./neovim.nix;
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
    gcc
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


  programs.neovim = vimsettings pkgs;
  home.file.".vimrc".source = ./.vimrc;

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
