{
  pkgs,
  config,
  lib,
  ...
}: let
  keepass = pkgs.keepass.override {
    plugins = [ pkgs.keepass-keepassrpc ];
  };
in {
  home.packages = with pkgs; [
    keepass
  ];
}
