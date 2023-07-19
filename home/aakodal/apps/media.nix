{
  pkgs,
  config,
  lib,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    ffmpeg-full
    yt-dlp
    playerctl
    pavucontrol
    pulsemixer
    vlc

    gimp
    unstable.flameshot
  ];
}
