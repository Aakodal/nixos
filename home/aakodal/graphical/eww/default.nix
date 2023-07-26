{
  pkgs,
  inputs,
  lib,
  ...
}: let
  eww = inputs.eww.packages.${pkgs.system}.eww-wayland;

  dependencies = with pkgs; [
    eww
    bash
    bc
    blueberry
    bluez
    coreutils
    dbus
    dunst
    findutils
    gawk
    gnused
    gojq
    jaq
    libnotify
    light
    networkmanager
    networkmanagerapplet
    pamixer
    pulseaudio
    ripgrep
    socat
    udev
    upower
    util-linux
    wget
    wireplumber
  ];
in {
  home.packages = dependencies;

  programs.eww = {
    enable = true;
    package = eww;
    # remove nix files
    configDir = lib.cleanSourceWith {
      filter = name: _type: let
        baseName = baseNameOf (toString name);
      in
        !(lib.hasSuffix ".nix" baseName);
      src = lib.cleanSource ./.;
    };
  };

  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Daemon";
      PartOf = [
	#"tray.target"
        "graphical-session.target"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${eww}/bin/eww daemon --no-daemonize";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
