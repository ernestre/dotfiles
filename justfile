default:
  @just --list

nixos-switch-vm:
    sudo nixos-rebuild switch --flake .#vm

hm-switch host:
    home-manager switch --flake .#{{ host }} --extra-experimental-features nix-command --extra-experimental-features flakes
