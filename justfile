_default:
  @just --list

_nixos-rebuild-pc action:
    sudo nixos-rebuild {{action}} --flake .#pc

hm-switch host:
    home-manager switch --flake .#{{ host }} --extra-experimental-features nix-command --extra-experimental-features flakes -b backup

nixos-test: (_nixos-rebuild-pc "test")
nixos-switch: (_nixos-rebuild-pc "switch")

hm-switch-erre: (hm-switch "erre")
hm-switch-mbp: (hm-switch "mbp")

store-fix:
    nix-store --verify --check-contents --repair

store-clean:
    nix-collect-garbage -d

tmux-source:
    tmux source-file ~/.config/tmux/tmux.conf
