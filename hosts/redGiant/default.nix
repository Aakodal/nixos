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
      extraPackages = with pkgs; [
        vaapiIntel
      ];
    };
  };
}
