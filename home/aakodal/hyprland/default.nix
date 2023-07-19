{
  pkgs,
  lib,
  config,
  inputs,
  self,
  ...
}: {
  imports = [
    ./config.nix
  ];

  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemdIntegration = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;
    };
  };
}
