{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;

    settings = {
      monitor = "eDP-1,preferred,0x0,1";
      "$mod" = "SUPER";

      exec-once = [
        "wbg /home/aakodal/Documents/wallpaper.jpg"
        "eww open bar"
      ];

      input = {
        follow_mouse = true;
        kb_layout = "fr";
        kb_variant = "oss";
        kb_options = "compose:end";
        numlock_by_default = if osConfig.networking.hostName == "helheim" then false else true;
        touchpad.natural_scroll = false;

        sensitivity = 0;
      };

      general = {
        border_size = 2;
        "col.active_border" = "rgba(bf616aee) rgba(b48eadee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        gaps_in = 5;
        gaps_out = 5;
        layout = "dwindle";
      };

      decoration = {
        blur = true;
        blur_size = 3;
        blur_passes = 1;
        blur_new_optimizations = true;
        "col.shadow" = "rgba(1a1a1aee)";
        drop_shadow = true;
        rounding = 10;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      animations = {
        enabled = true;

        bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
        animation = [
          "border, 1, 10, default"
          "fade, 1, 10, default"
          "windows, 1, 4, overshot, slide"
          "workspaces, 1, 6, overshot, slide"
        ];
      };

      dwindle = {
        preserve_split = true;
        pseudotile = true;
      };

      master.new_is_master = true;
      misc.disable_hyprland_logo = true;
      gestures.workspace_swipe = false;

      bind = [
        # System
        "$mod, Return, exec, alacritty"
        "$mod, Q, killactive"
        "$mod SHIFT, E, exec, '/home/aakodal/.config/rofi/scripts/powermenu.sh'"
        "$mod, P, pseudo, "
        "$mod, J, togglesplit, "
        "$mod, F, togglefloating, "
        "$mod, D, exec, rofi -modi drun -show drun -theme '/home/aakodal/.config/rofi/rasi/launcher.rasi'"
        "$mod SHIFT, F, fullscreen"
        "$mod, L, exec, swaylockd --screenshots --effect-blur 5x5"

        # Apps
        "$mod, N, exec, dolphin"
        "$mod, W, exec, firefox"
        ", Print, exec, XDG_CURRENT_DESKTOP=sway flameshot gui"
        "SHIFT, Print, exec, XDG_CURRENT_DESKTOP=sway flameshot gui --raw | wl-copy"

        # Multimedia
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, parmixer -d 5"

        # Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

        # Windows 
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        # Workspaces 
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod NUM_LOCK, 87, workspace, 1"
        "$mod NUM_LOCK, 88, workspace, 2"
        "$mod NUM_LOCK, 89, workspace, 3"
        "$mod NUM_LOCK, 83, workspace, 4"
        "$mod NUM_LOCK, 84, workspace, 5"
        "$mod NUM_LOCK, 85, workspace, 6"
        "$mod NUM_LOCK, 79, workspace, 7"
        "$mod NUM_LOCK, 80, workspace, 8"
        "$mod NUM_LOCK, 81, workspace, 9"
        "$mod NUM_LOCK, 90, workspace, 10"
        "$mod NUM_LOCK SHIFT, 87, movetoworkspacesilent, 1"
        "$mod NUM_LOCK SHIFT, 88, movetoworkspacesilent, 2"
        "$mod NUM_LOCK SHIFT, 89, movetoworkspacesilent, 3"
        "$mod NUM_LOCK SHIFT, 83, movetoworkspacesilent, 4"
        "$mod NUM_LOCK SHIFT, 84, movetoworkspacesilent, 5"
        "$mod NUM_LOCK SHIFT, 85, movetoworkspacesilent, 6"
        "$mod NUM_LOCK SHIFT, 79, movetoworkspacesilent, 7"
        "$mod NUM_LOCK SHIFT, 80, movetoworkspacesilent, 8"
        "$mod NUM_LOCK SHIFT, 81, movetoworkspacesilent, 9"
        "$mod NUM_LOCK SHIFT, 90, movetoworkspacesilent, 10"
      ] ++ (
        builtins.concatLists (builtins.genList (
          x: let 
            ws = let
             c = (x + 1) / 11;
            in 
              builtins.toString (x + 10 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
          ]
	) 10)
      );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
