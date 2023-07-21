{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    ungoogled-chromium
  ];
}
