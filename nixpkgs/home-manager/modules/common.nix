{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    fd
    git
    gnumake
    gopass
    jq
    just
    pwgen
    ripgrep
    tree
    yq-go
    delve # go dap debug
    sops
    font-awesome
    yazi
    trash-cli
    parallel
    playerctl
    eza
    (pkgsUnstable.nerdfonts.override { fonts = [ "GeistMono" ]; })

    nodejs_22
    (yarn.override { nodejs = nodejs_22; })
    nodePackages."intelephense"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
  ];

  fonts.fontconfig.enable = true;

  programs.fzf.enable = true;

  programs.direnv.enable = true;
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.go.enable = true;

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = false;

      character = {
        success_symbol = "[󰊠 ](bold #cba6f7)[󰊠 ](bold #f2cdcd)[󰊠 ](bold #b4befe)[ ](bold #a6e3a1)";
        error_symbol = "[󰊠 ](bold #cba6f7)[󰊠 ](bold #f2cdcd)[󰊠 ](bold #b4befe)[ ](bold #f38ba8)";
        vimcmd_symbol = "[ NORMAL](bold #fab387)";
        vimcmd_visual_symbol = "[ VISUAL](bold #89dceb)";
      };

      git_branch = {
        symbol = " ";
      };

      git_status = {
        deleted = "[-$count  ](red) ";
        modified = "[+$count  ](yellow) ";
        staged = "[+$count  ](green) ";
        stashed = "  ";
        untracked = "[+$count  ](white) ";

        format = "[$all_status$ahead_behind ]($style)";
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --color-only --dark --paging=never";
          useConfig = false;
        };
      };
    };
  };

  nixpkgs.overlays = [
    (import ../../overlays/markdown-preview-nvim { inherit pkgs; })
  ];
}
