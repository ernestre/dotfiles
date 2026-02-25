{ pkgs, ... }: {
  home.packages = with pkgs; [
    picom
  ];

  home.file.".config/picom/picom.conf".source = ./config/picom.conf;
}
