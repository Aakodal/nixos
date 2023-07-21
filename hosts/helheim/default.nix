{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  config = {
    hardware.opengl = {
      package = pkgs.mesa.drivers;
      extraPackages = with pkgs; [
        vaapiIntel
      ];
    };
  };
}
