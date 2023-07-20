{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    ungoogled-chromium
  ];
}
