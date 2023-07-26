{
  pkgs,
  ...
}: let
  fluent-icons = pkgs.fluent-icon-theme.override {
    roundedIcons = true;
    colorVariants = [ "standard" ];
  };
in {
  home.packages = [
    #fluent-icons
    pkgs.qogir-icon-theme
  ];

  gtk.iconTheme = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;
  };
}
