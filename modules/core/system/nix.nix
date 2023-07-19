{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: with lib; {
  system = {
    autoUpgrade.enable = false;
    stateVersion = lib.mkDefault "22.11";
  };

  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [ "nix-command" "flakes" ];

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget curl git
  ];
}
