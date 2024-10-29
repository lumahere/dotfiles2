{config, pkgs, ...}:
{

   environment.systemPackages = with pkgs; [
    wget vim gcc flatpak-builder kitty gnumake 
   ];
 fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
];

    programs.hyprland. enable = true;
    xdg.portal  = {enable = true; wlr.enable = true;};
    services.flatpak.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    xdg.portal.config.common.default = "hyprland";
    programs.fish.enable = true;
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];

    services.fwupd.enable = true;
}
