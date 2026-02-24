{ pkgs, config, models }:
let
  allModels = builtins.concatStringsSep "," models;

  claudeCodeRouterConfig = {
    HOST = "127.0.0.1";
    PORT = 3456;
    API_TIMEOUT_MS = "600000";
    Providers = [
      {
        name = "nexosai";
        api_base_url = "https://api.nexos.ai/v1/chat/completions";
        api_key = "$NEXOS_API_KEY";
        inherit models;
        transformer.use = [ "OpenAI" ];
      }
    ];
    Router = {
      default = "nexosai,${allModels}";
      background = "nexosai,${allModels}";
      think = "nexosai,${allModels}";
      longContext = "nexosai,${allModels}";
      longContextThreshold = 60000;
    };
  };
in
{
  home.file.".claude-code-router/config.json".text = builtins.toJSON claudeCodeRouterConfig;

  home.packages = with pkgs; [
    claude-code
    claude-code-router
  ];
}
