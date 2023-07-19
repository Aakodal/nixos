{
  pkgs,
  unstable,
  ...
}: {
  home.packages = with pkgs; [ wbg ];
}
