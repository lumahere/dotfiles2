{pkgs, config, ...}:
{
    
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "rofi";
    "$audioSink" = "pamixer";
    bind =
      [
    "bind = $mod, T, exec, $terminal"
		"$mod, Q, killactive"
		"$mod, Delete, exit,"
		"$mod, E, exec, $fileManager"
		"$mod, SPACE, togglefloating,"
		"$mod, A, exec, pkill $menu || $menu -show drun"
		"$mod, R, exec, pkill $menu || $menu -show run"
		"$mod, W, exec, pkill $menu || $menu -show window"
		"$mod, P, pseudo,"
		"$mod, J, togglesplit"
		"$mod, B, exec, $browser"
		"$mod, K, exec, pkill waybar || waybar" 

		"$mod, left, movefocus, l"
		"$mod, right, movefocus, r"
		"$mod, up, movefocus, u"
		"$mod, down, movefocus, d"
		"$mod, ESCAPE, exec, wlogout"
		"$mod SHIFT, ESCAPE, exec, btop"
		"$mod, F, fullscreen"

		
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
      bindm = [
    # mouse movements
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
	"$mod ALT, mouse:272, resizewindow"
	    ];
	bindel = [
	# Laptop multimedia keys for volume and LCD brightness
	",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	];
	bindl = [
	# Requires playerctl
	", XF86AudioNext, exec, playerctl next"
	", XF86AudioPause, exec, playerctl play-pause"
	", XF86AudioPlay, exec, playerctl play-pause"
	", XF86AudioPrev, exec, playerctl previous"
	];
general = {
	    gaps_in = 5;
	    gaps_out = 20;
	    border_size = 2;
	};
	decoration = {
	    active_opacity = 0.9;
	    inactive_opacity = 0.6;
	    rounding = 10;
	    drop_shadow = true;
	    shadow_range = 4;
	    shadow_render_power = 3;
	    "col.shadow" = "rgba(1a1a1aee)";

	  blur = {
		  enabled = true;
		  size = 3;
		  passes = 2;
		  vibrancy = 0.1832;
	  };
	};
};

}
