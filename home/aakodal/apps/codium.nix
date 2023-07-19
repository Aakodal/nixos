{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    vscodium
  ];
}
