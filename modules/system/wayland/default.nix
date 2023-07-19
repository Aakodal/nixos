{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./environment.nix
    ./portals.nix
  ];
}
