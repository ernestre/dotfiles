{ pkgs, ... }:
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
      genpass = "pwgen -CnysB 32 1";
      docker-image-size = "function() {docker inspect -f '{{.Size}}' $1 | numfmt --to=si}";
      dd = "delta --diff-so-fancy";
      lg = "lazygit";
      dc = "docker compose";
      ld = "lazydocker";
      ls = "eza --icons --long";
      drmi = "docker run --rm -it";
      v = "vim";
      vn = "vim -c \":VimwikiIndex\"";
      newpass = "pwgen -CnysB 32 1";

      rm = "trash";
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
          xset r rate 300 20
        fi

        n () {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
          fi
          rm -f -- "$tmp"
      }
    '';
  };
}
