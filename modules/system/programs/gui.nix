{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xfce.tumbler
    libgsf
    ffmpegthumbnailer
    ark
  ];

  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    nm-applet.enable = true;
  };

  services.tumbler.enable = true;
}
