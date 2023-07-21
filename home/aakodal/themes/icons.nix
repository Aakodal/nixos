{
  pkgs,
  ...
}: let
  fluent-icons = pkgs.fluent-icon-theme.override {
    roundedIcons = true;
    colorVariants = [ "teal" ];
  };
in {
  home.packages = [
    fluent-icons
  ];

  gtk.iconTheme = {
    name = "Fluent light";
    package = fluent-icons;
  };
}
