_: {
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  systemd.user.services = {
    pipewire.wantedBy = ["default.target"];
    pipewire-pulse.wantedBy = ["default.target"];
  };
}
