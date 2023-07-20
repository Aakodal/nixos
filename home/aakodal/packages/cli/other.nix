{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pciutils
  ];
}
