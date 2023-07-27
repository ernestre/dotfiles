{ pkgs }:
final: prev:
let
  markdown-preview-nvim = prev.vimPlugins.markdown-preview-nvim.overrideAttrs
    (
      old:
      let
        nodeDep = pkgs.mkYarnPackage {
          name = "node-modules";
          src = ./.;
          packageJSON = ./package.json;
          yarnLock = ./yarn.lock;
        };
      in
      {
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
