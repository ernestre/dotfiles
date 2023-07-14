{
  programs.git = {
    enable = true;

    userEmail = "ernest.rekel@gmail.com";
    userName = "Ernest Rekel";

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
      lgs = "log --all --decorate --oneline --graph --stat";
      contrib = "shortlog -ns";
      publish = "!git push -u origin $(git rev-parse --abbrev-ref HEAD)";
    };

    ignores = [
      "*.swp"
      ".DS_Store"
      ".direnv"
      "/node_modules"
    ];

    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      fetch.prune = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "tracking";
      rebase.autoStash = true;
    };

    delta = {
      enable = true;
      options = {
        chameleon = {
          dark = true;
          line-numbers = true;
          side-by-side = true;
          keep-plus-minus-markers = true;
          syntax-theme = "Monokai Extended";
          hunk-header-style = "omit";
          minus-style = "bold red";
          minus-emph-style = "bold red";
          plus-style = "bold green";
          plus-emph-style = "bold green";
          zero-style = "syntax";
          blame-code-style = "syntax";
          blame-format = "{author:<18} ({commit:>7}) {timestamp:^12} ";
          blame-palette = "#2E3440 #3B4252 #434C5E #4C566A";
        };
        features = "chameleon";
        side-by-side = true;
      };
    };
  };
}
