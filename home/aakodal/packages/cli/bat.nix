{
  pkgs,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    bat
  ];

  programs.bat.config.theme = "GitHub";
}
