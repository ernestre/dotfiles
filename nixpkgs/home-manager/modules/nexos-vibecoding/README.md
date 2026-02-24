## Example

```nix
{ pkgs, config, ... }:
{
  imports = [
    ./modules/nexos-vibecoding
  ];

  nexos-vibecoding = {
    models = [
      "Claude Opus 4.6 (Trusted)"
      "Claude Sonet 4 (Trusted)"
      "Gemini 2.0 Flash (Trusted)"
    ];
    opencode.enable = true;
    claude-code.enable = true;
  };

  sops = {
    defaultSopsFile = ../secrets/local-dev.yaml;
    gnupg.home = "${config.home.homeDirectory}/.gnupg";

    secrets = {
      "nexos-token" = {
        key = "nexos-token";
      };
    };
  };

  programs.zsh = {
    initContent = ''
      export NEXOS_API_KEY="$(cat ${config.sops.secrets."nexos-token".path} 2>/dev/null)"
    '';
  };
}
```
