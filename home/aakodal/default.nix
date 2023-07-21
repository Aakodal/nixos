_: {
  imports = [
    ./desktop
    ./graphical
    ./packages
    ./terminal
    ./themes
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
