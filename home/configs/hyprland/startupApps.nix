{config, ...}:
{
    wayland.windowManager.hyprland.extraConfig = ''
    exec-once = swww init & swww img /home/nocta/.wall/primary.jpg
    exec-once = waybar
    exec-once = blueman-applet
    exec-once = nm-applet
    '';
}