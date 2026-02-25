{
  programs.git = {
    enable = true;

    ignores = [
      "*.swp"
      ".DS_Store"
      ".direnv"
      "/node_modules"
    ];

    settings = {
      branch.autosetuprebase = "always";
      color.ui = true;
      fetch.prune = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "tracking";
      rebase.autoStash = true;
      rerere.enabled = true;
      diff.algorithm = "histogram";
      diff.context = 2;
      merge.conflictstyle = "zdiff3";

      user = {
        email = "ernest.rekel@gmail.com";
        name = "Ernest Rekel";
      };

      alias = {
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
        lgs = "log --all --decorate --oneline --graph --stat";
        contrib = "shortlog -ns";
        publish = "!git push -u origin $(git rev-parse --abbrev-ref HEAD)";
      };
    };

  };

  programs.delta = {
    enable = true;
    options = {
      side-by-side = true;
    };
  };
}
