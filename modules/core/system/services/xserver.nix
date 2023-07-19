{
  config,
  pkgs,
  ...
}: {
  config = {
    services.xserver = {
      enable = true;
      layout = "fr";
      xkbOptions = "eurosign:e";

      # Touchpad support
      libinput.enable = true;
    };
  };
}
