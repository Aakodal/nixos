{
  pkgs,
  ...
}: {
  imports = [
    ./ssh.nix
  ];

  config = {
    networking = {
      networkmanager.enable = true;

      nftables.enable = false;
      firewall = {
        enable = true;
        package = pkgs.iptables;
      };
    };

    systemd.services.NetworkManager-wait-online.enable = false;
    hardware.wirelessRegulatoryDatabase = true;
  };
}
