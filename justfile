nixos-switch-vm:
    sudo nixos-rebuild switch --flake .#vm

hm-switch-erre:
    home-manager switch --flake .#erre --extra-experimental-features nix-command --extra-experimental-features flakes
