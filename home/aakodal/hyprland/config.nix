{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''
    monitor=eDP-1,1366x768,0x0,1
    monitor=X11-1,1366x768,0x0,1

    #exec-once=~/.config/hypr/autostart
    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once = wbg /home/aakodal/Documents/wallpaper.jpg
    exec-once = eww open bar
    exec=xmodmap -e "keysym End = Multi_key"

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
      kb_layout = fr
      kb_variant = oss
      kb_model =
      kb_options = compose:end
      kb_rules =
      #numlock_by_default = yes

      follow_mouse = 1

      touchpad {
          natural_scroll = no
      }

      sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 5
      border_size = 2
      # col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      col.active_border = rgba(bf616aee) rgba(b48eadee) 45deg
      col.inactive_border = rgba(595959aa)

      layout = dwindle

      cursor_inactive_timeout = 5
    }

    decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 10
      blur = yes
      blur_size = 3
      blur_passes = 1
      blur_new_optimizations = on

      drop_shadow = yes
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)
    }

    animations {
      enabled = yes

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      #bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      bezier = overshot, 0.13, 0.99, 0.29, 1.1

      animation = windows, 1, 4, overshot, slide
      # animation = windowsOut, 1, 7, default, popin 80%
      animation = border, 1, 10, default
      animation = fade, 1, 10, default
      animation = workspaces, 1, 6, overshot, slidevert
    }

    dwindle {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = yes # you probably want this
    }

    misc {
      disable_hyprland_logo = yes
    }

    master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      new_is_master = true
    }

    gestures {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      workspace_swipe = off
    }

    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
    device:epic mouse V1 {
      sensitivity = -0.5
    }

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    $mainMod = SUPER

    # Misc keybindings
    bind = $mainMod, Return, exec, alacritty
    bind = $mainMod, Q, killactive, 
    bind = $mainMod SHIFT, E, exec, "/home/aakodal/.config/rofi/scripts/powermenu.sh"
    bind = $mainMod, N, exec, dolphin
    bind = $mainMod, D, exec, rofi -show drun -theme "/home/aakodal/.config/rofi/rasi/launcher.rasi"
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, F, togglefloating, 
    bind = $mainMod SHIFT, F, fullscreen
    bind = $mainMod, L, exec, swaylockd --screenshots --effect-blur 5x5
    bind = $mainMod, W, exec, firefox
    bind = , Print, exec, XDG_CURRENT_DESKTOP=sway flameshot gui

    # Multimedia keybindings
    bind = , XF86AudioMute, exec, pamixer -t
    bind = , XF86AudioRaiseVolume, exec, pamixer -i 5
    bind = , XF86AudioLowerVolume, exec, pamixer -d 5

    # Brightness keybindings
    bind = , XF86MonBrightnessUp, exec, brightnessctl s 5%+
    bind = , XF86MonBrightnessDown, exec, brightnessctl s 5%-

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Move windows
    bind = $mainMod SHIFT, left, movewindow, l
    bind = $mainMod SHIFT, right, movewindow, r
    bind = $mainMod SHIFT, up, movewindow, u
    bind = $mainMod SHIFT, down, movewindow, d

    # Switch workspaces with mainMod + [0-9]
    ${
      builtins.concatStringsSep "\n" (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in ''
          bind = $mainMod, ${ws}, workspace, ${toString (x + 1)}
          bind = $mainMod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}
        ''
      )
      10)
    }

    bind = $mainMod, 38, workspace, 1
    bind = $mainMod, 233, workspace, 2
    bind = $mainMod, 34, workspace, 3
    bind = $mainMod, 39, workspace, 4
    bind = $mainMod, 40, workspace, 5
    bind = $mainMod, 45, workspace, 6
    bind = $mainMod, 232, workspace, 7
    bind = $mainMod, 95, workspace, 8
    bind = $mainMod, 231, workspace, 9
    bind = $mainMod, 224, workspace, 10

    # Manually bind with numlock as there is no logic here
    bind = $mainMod NUM_LOCK, 87, workspace, 1
    bind = $mainMod NUM_LOCK, 88, workspace, 2
    bind = $mainMod NUM_LOCK, 89, workspace, 3
    bind = $mainMod NUM_LOCK, 83, workspace, 4
    bind = $mainMod NUM_LOCK, 84, workspace, 5
    bind = $mainMod NUM_LOCK, 85, workspace, 6
    bind = $mainMod NUM_LOCK, 79, workspace, 7
    bind = $mainMod NUM_LOCK, 80, workspace, 8
    bind = $mainMod NUM_LOCK, 81, workspace, 9
    bind = $mainMod NUM_LOCK, 90, workspace, 10
    bind = $mainMod SHIFT NUM_LOCK, 87, movetoworkspacesilent, 1
    bind = $mainMod SHIFT NUM_LOCK, 88, movetoworkspacesilent, 2
    bind = $mainMod SHIFT NUM_LOCK, 89, movetoworkspacesilent, 3
    bind = $mainMod SHIFT NUM_LOCK, 83, movetoworkspacesilent, 4
    bind = $mainMod SHIFT NUM_LOCK, 84, movetoworkspacesilent, 5
    bind = $mainMod SHIFT NUM_LOCK, 85, movetoworkspacesilent, 6
    bind = $mainMod SHIFT NUM_LOCK, 79, movetoworkspacesilent, 7
    bind = $mainMod SHIFT NUM_LOCK, 80, movetoworkspacesilent, 8
    bind = $mainMod SHIFT NUM_LOCK, 81, movetoworkspacesilent, 9
    bind = $mainMod SHIFT NUM_LOCK, 90, movetoworkspacesilent, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
  '';
}
