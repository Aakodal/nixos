{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  imports = [
    ./browsers.nix
    ./codium.nix
    ./desktop.nix
    ./discord.nix
    ./media.nix
    ./office.nix
  ];
}