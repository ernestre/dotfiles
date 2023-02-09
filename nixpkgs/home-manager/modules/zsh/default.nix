{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "wd"
        "kubectl"
        "helm"
      ];
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

    initExtra = ''
      # Linux alternative for OSX pbcopy
      if ! [ -x "$(command -v pbpaste)" ]; then
        alias pbpaste='xclip -selection clipboard -o'
      fi

      if ! [ -x "$(command -v pbcopy)" ]; then
        alias pbcopy='xclip -selection clipboard'
      fi

      if [ -x "$(command -v xset)" ]; then
        xset r rate 300 85
      fi
    '';
  };
}
