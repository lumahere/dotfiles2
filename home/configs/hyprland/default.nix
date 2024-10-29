{pkgs, config, ...}:
{   
    imports = [
        ./settings.nix
        ./theme.nix
        ./startupApps.nix
        ./theme.nix
        ./wallpaper.nix
        ./env.nix
    ];
    wayland.windowManager.hyprland.enable = true; # enable Hyprland
    wayland.windowManager.hyprland.systemd.variables = ["--all"];
}
