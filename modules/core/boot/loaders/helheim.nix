{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.networking.hostName == "helheim") {
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
