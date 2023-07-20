{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  config = {
    hardware.opengl = {
      enable = true;
      package = pkgs.mesa.drivers;
      extraPackages = with pkgs; [
        vaapiIntel
      ];
    };
  };
}
