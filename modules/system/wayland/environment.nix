{
  inputs,
  ...
}: {
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    GDK_BACKEND = "wayland,x11";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";

    DISABLE_QT5_COMPAT = "0";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";

    WLR_NO_HARDWARE_CURSORS = "1";

    XDG_SESSION_TYPE = "wayland";
    XDG_BACKEND = "wayland";
  };

  nixpkgs.overlays = with inputs; [ nixpkgs-wayland.overlay ];
}
