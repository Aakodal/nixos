{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    vscodium
  ];
}
