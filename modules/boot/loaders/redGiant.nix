{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: with lib; {
  config = mkIf (config.networking.hostName == "red-giant") {
    boot.loader = {
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
    };
  };
}
