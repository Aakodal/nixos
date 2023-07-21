_: {
  imports = [
    ./apps
    ./eww
    ./hyprland.nix
    ./packages
    ./terminal
  ];

  config = {
    home = {
      username = "aakodal";
      homeDirectory = "/home/aakodal";
      stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
  };
}
