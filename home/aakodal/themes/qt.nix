{
  pkgs,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = "qtct";

    style = {
      package = pkgs.qogir-kde;
      name = "Qogir-light";
    };
  };

  home = {
    packages = with pkgs; [
      qt5.qttools
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      breeze-icons
    ];

    sessionVariables = {
      #QT_STYLE_OVERRIDE = "kvantum";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT5_COMPAT = "0";
    };
  };

  xdg.configFile = {
    "kdeglobals".source = "${pkgs.qogir-kde}/share/color-schemes/QogirLight.colors";
    "Kvantum/Qogir-light/Qogir-light.kvconfig".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/vinceliuice/Qogir-kde/master/Kvantum/Qogir-light/Qogir-light.kvconfig";
      sha256 = "01d53jv0gn5p65dcinrzsgd396n7wd0yjynp9xkf08zw1ic766vd";
    };

    "Kvantum/Qogir-light/Qogir-light.svg".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/vinceliuice/Qogir-kde/master/Kvantum/Qogir-light/Qogir-light.svg";
      sha256 = "0abilacalysr1hqz4gbv1k3r680h7f9a87cqhyr0hi3i4pwh8yq9";
    };

    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Qogir-light
    '';
  };
}
