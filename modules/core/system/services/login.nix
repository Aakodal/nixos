{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = {
    security.pam.services = {
      login.enableGnomeKeyring = true;

      sddm = {
        gnupg.enable = true;
        enableGnomeKeyring = true;
      };
    };

    services.xserver.displayManager.sddm.enable = true;
    services.xserver.displayManager.sessionPackages = [ inputs.hyprland.packages.${pkgs.system}.default ];
  };
}
