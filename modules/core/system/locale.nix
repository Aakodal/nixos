{
  pkgs,
  ...
}: {
  config = {
    time.timeZone = "Europe/Paris";

    i18n = {
      defaultLocale = "fr_FR.UTF-8";
    };
    console = {
      font = "Lat2-Terminus16";
      useXkbConfig = true;
    };
  };
}
