{ pkgs, lib, ... }:
let
  zsh-z = pkgs.fetchFromGitHub {
    owner = "agkozak";
    repo = "zsh-z";
    rev = "da8dee3ccaf882d1bf653c34850041025616ceb5";
    sha256 = "sha256-MHb9Q7mwgWAs99vom6a2aODB40I9JTBaJnbvTYbMwiA=";
  };
in
{
  programs.zsh = {
    enable = true;

    plugins = [{
      name = "zsh-z";
      src = zsh-z;
    }];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "wd"
        "kubectl"
        "helm"
        "tmuxinator"
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
      docker-compose = "docker compose --compatibility $@";
      genpass = "pwgen -CnysB 32 1";
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
