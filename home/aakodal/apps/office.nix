{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-any
    hunspellDicts.en_US-large
  ];
}
