_nixos-rebuild-pc action:
    sudo nixos-rebuild {{action}} --flake .#pc

default:
  @just --list

nixos-test: (_nixos-rebuild-pc "test")
nixos-switch: (_nixos-rebuild-pc "switch")

hm-switch host:
    home-manager switch --flake .#{{ host }} --extra-experimental-features nix-command --extra-experimental-features flakes -b backup
