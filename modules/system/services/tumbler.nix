{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libgsf
    ffmpegthumbnailer
  ];

  services.tumbler.enable = true;
}
