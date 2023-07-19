{
  config,
  pkgs,
  ...
}: {
  config = {
    location = {
      latitude = 48.1;
      longitude = 11.6;
    };

    services.redshift = {
      enable = true;
      temperature = {
        day = 4600;
        night = 4600;
      };
      brightness.day = "0.8";
      brightness.night = "0.8";
    };
  };
}
