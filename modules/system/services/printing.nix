{
  pkgs,
  ...
}: {
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };

    avahi = {
      enable = true;
      nssmdns = true;
    };
  };
}
