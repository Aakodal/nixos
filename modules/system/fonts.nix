{
  pkgs,
  ...
}: {
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    fonts = with pkgs; [
      calibri
      corefonts
      dejavu_fonts
      jetbrains-mono
      lato
      material-icons
      material-symbols
      material-design-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      powerline-fonts
      product-sans
      roboto

      (nerdfonts.override {
        fonts = [
	  "JetBrainsMono"
	];
      })
    ];
  };
}
