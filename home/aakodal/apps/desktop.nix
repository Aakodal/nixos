{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ wbg ];
}
