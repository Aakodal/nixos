{
  pkgs,
  inputs,
  ...
}: let
  hyprland-portal = inputs.xdg-portal-hyprland.packages.${pkgs.system};
in {
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      (hyprland-portal.xdg-desktop-portal-hyprland.override {
        hyprland-share-picker = hyprland-portal.hyprland-share-picker.override {
          hyprland = inputs.hyprland.packages.${pkgs.system}.default;
        };
      })
    ];

    wlr.enable = false;
  };
}
