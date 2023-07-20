{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    macchina
  ];

  xdg.configFile."macchina/macchina.toml".source = ./config.toml;
  xdg.configFile."macchina/themes/Silicon.toml".source = ./theme.toml;
}
