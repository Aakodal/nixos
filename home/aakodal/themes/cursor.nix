{
  pkgs,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.libsForQt5.breeze-icons;
    name = "Breeze Light";

    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}