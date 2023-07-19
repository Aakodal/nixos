{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./nix-ld.nix
  ];
}
