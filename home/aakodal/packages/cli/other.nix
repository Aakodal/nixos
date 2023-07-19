{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovim
    pciutils
  ];
}
