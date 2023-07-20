{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bat
  ];

  programs.bat.config.theme = "GitHub";
}
