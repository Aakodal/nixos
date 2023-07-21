{
  pkgs,
  ...
}: let
  qogir = pkgs.qogir-theme.override {
    themeVariants = [ "default" ];
    colorVariants = [ "light" ];
    tweaks = [ "round" ];
  };
in {
  home = {
    packages = with pkgs; [
      glib
      qogir
      dconf
    ];

    sessionVariables = {
      GTK_THEME = "Qogir-Light";
      GTK_USE_PORTAL = "1";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Qogir-Light";
      package = qogir;
    };

    font = {
      name = "Noto Sans Regular";
      size = 10;
    };
  };
}
