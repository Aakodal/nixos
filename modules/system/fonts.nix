{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  config = {
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
        corefonts
        material-icons
        material-design-icons
        roboto
        lato
        dejavu_fonts
        powerline-fonts
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        jetbrains-mono

        (nerdfonts.override {fonts = ["JetBrainsMono"];})
      ];
    };
  };
}
