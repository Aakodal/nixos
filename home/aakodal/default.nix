{
  inputs,
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default

    ./apps
    ./eww
    ./hyprland
    ./packages
    ./terminal
  ];

  config = {
    home = {
      username = "aakodal";
      homeDirectory = "/home/aakodal";
      stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
  };
}
