{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    ungoogled-chromium
  ];
}
