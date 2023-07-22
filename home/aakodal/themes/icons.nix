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
    fluent-icons
  ];

  gtk.iconTheme = {
    name = "Fluent";
    package = fluent-icons;
  };
}
