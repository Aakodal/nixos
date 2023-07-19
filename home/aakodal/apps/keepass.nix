{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: let
  keepass = unstable.keepass.override {
    plugins = [ unstable.keepass-keepassrpc ];
  };
in {
  home.packages = with pkgs; [
    keepass
  ];
}
