{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    git
    gnumake
    go
    gopass
    jq
    just
    pwgen
    ripgrep
    terraform
    tmux
    tree
    yq-go
    delve # go dap debug
    sops
    font-awesome
    ranger
    (nerdfonts.override { fonts = [ "Go-Mono" ]; })

    nodejs-18_x
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

  nixpkgs.overlays = [
    (final: prev:
      let
        markdown-preview-nvim = prev.vimPlugins.markdown-preview-nvim.overrideAttrs
          (
            old:
            let
              nodeDep = pkgs.mkYarnPackage {
                name = "node-modules";
                src = ../../overlays/markdown-preview-nvim/deps/.;
              };
            in
            {
              postInstall = ''
                ln -s ${nodeDep}/libexec/markdown-preview/node_modules $out/app
              '';
            }
          );
      in
      {
        vimPlugins = prev.vimPlugins // {
          inherit markdown-preview-nvim;
        };
      }
    )
  ];
}
