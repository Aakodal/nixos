{
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      cursor.style.shape = "Beam";
      window = {
        dimensions = {
          columns = 95;
          lines = 25;
        };
        opacity = 0.85;
      };
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [
          "-is" "eval" "clear && macchina"
        ];
      };

      font.normal = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };

      colors = {
        primary = {
          background = "0xeff1f6";
          foreground = "0x2e3440";
        };

        normal = {
          black = "0x3b4252";
          red = "0xbf616a";
          green = "0xa3be8c";
          yellow = "0xdda97d";
          blue = "0x5e81ac";
          magenta = "0xb48ead";
          cyan = "0x88c0c0";
          white = "0xe5e9f0";
        };

        bright = {
          black = "0xb5bcc9";
          red = "0xdaa4aa";
          green = "0xbed1ad";
          yellow = "0xebcb8b";
          blue = "0xabbdd4";
          magenta = "0xccb3c7";
          cyan = "0xa4cfdb";
          white = "0xeceff4";
        };

        cursor = {
          text = "0xD8DEE9";
          cursor = "0x2E3440";
        };
      };
    };
  };
}
