{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: with lib; {
  config = {
    boot = {
      kernelParams = [
        "logo.nologo"
        "quiet"
        "rd.systemd.show_status=auto"
        "rd.udev.log_level=3"
        "loglevel=3"
      ];
    };
  };
}
