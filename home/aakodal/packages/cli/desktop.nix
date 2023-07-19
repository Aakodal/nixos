{
  pkgs,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
    imagemagick
    gcc
    cmake
    git
    fzf
    file
    zip
    unzip
    ripgrep
    gnugrep
    exa
    wget
    curl
    feh
    brightnessctl
    findutils
  ];
}
