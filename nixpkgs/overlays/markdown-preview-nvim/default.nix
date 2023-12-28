# This overlay updates plugin's dependencies because of fsevents package remove code execution vulnerability
{ pkgs }:
final: prev:
let
  markdown-preview-nvim = prev.vimPlugins.markdown-preview-nvim.overrideAttrs
    (
      old:
      let
        nodeDep = pkgs.mkYarnPackage {
          name = "mkp-node-modules";
          src = ./.;
          packageJSON = ./package.json;
          yarnLock = ./yarn.lock;
        };
      in
      {
        src = builtins.fetchGit {
          url = "https://github.com/ernestre/markdown-preview.nvim";
          ref = "bump-socket-io";
          rev = "90d3fdbf4876edd5c3c033006494887622add320";
        };

        patches = [ ];
        postInstall = ''
          ln -s ${nodeDep}/libexec/markdown-preview/node_modules $out/app
        '';
      }
    );
in
{
  vimPlugins = prev.vimPlugins // {
    inherit markdown-preview-nvim;
  };
}
