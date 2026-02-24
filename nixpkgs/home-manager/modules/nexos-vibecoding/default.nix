{ pkgs, config, lib, ... }:
let
  cfg = config.nexos-vibecoding;

  opencodeModule = import ./opencode {
    inherit pkgs config;
    models = cfg.models;
  };

  claudeCodeModule = import ./claude-code {
    inherit pkgs config;
    models = cfg.models;
  };
in
{
  options.nexos-vibecoding = {
    models = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of model names to use with the nexos provider.";
    };

    opencode.enable = lib.mkEnableOption "opencode";
    claude-code.enable = lib.mkEnableOption "claude-code with claude-code-router";
  };

  config = lib.mkMerge [
    {
      home.packages = with pkgs; [
        bubblewrap
        socat
      ];
    }

    (lib.mkIf cfg.opencode.enable opencodeModule)

    (lib.mkIf cfg.claude-code.enable claudeCodeModule)
  ];
}
