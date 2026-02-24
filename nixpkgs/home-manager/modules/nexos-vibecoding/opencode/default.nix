{ pkgs, config, models }:
let
  opencodeConfig = {
    "$schema" = "https://opencode.ai/config.json";
    provider.nexos = {
      npm = "@ai-sdk/openai-compatible";
      options = {
        baseURL = "https://api.nexos.ai/v1";
        apiKey = "{env:NEXOS_API_KEY}";
      };
      models = builtins.listToAttrs (map
        (m: {
          name = m;
          value = { name = m; };
        })
        models);
    };
  };
in
{
  home.file.".config/opencode/opencode.json".text = builtins.toJSON opencodeConfig;

  home.packages = [ pkgs.opencode ];
}
