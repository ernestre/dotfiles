default:
  @just --list

nixos-switch-pc:
    sudo nixos-rebuild switch --flake .#pc

hm-switch host:
    home-manager switch --flake .#{{ host }} --extra-experimental-features nix-command --extra-experimental-features flakes -b backup
