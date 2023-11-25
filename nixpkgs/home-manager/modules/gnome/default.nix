{ lib, ... }:
{
  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings =
    let
      mkTuple = lib.hm.gvariant.mkTuple;
    in
    {
      "org/gnome/desktop/input-sources" = {
        per-window = true;
        sources = [
          (mkTuple [ "xkb" "us" ])
          (mkTuple [ "xkb" "ru+phonetic_YAZHERTY" ])
        ];
      };
    };
}
