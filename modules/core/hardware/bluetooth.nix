{
  pkgs,
  ...
}: {
  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = true;
    settings.General.MultiProfile = "multiple";
  };
}
