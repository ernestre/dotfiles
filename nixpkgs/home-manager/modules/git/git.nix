{ pkgs, lib, ... }:
{
  home.file.".gitconfig".source = ./.gitconfig;
  home.file.".gitignore_global".source = ./.gitignore_global;

  programs.git = {
    delta = { enable = true; };

    enable = true;
    # userEmail = "ernest.rekel@gmail.com";
    # userName = "Ernest Rekel";
    #
    # extraConfig = {
    #   branch.autosetuprebase = "always";
    #   color.ui = true;
    #   diff.colorMoved = "zebra";
    #   fetch.prune = true;
    #   github.user = "ernestre";
    #   init.defaultBranch = "main";
    #   pull.rebase = true;
    #   push.default = "tracking";
    #   rebase.autoStash = true;
    # };

  };
}
