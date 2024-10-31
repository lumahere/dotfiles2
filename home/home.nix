{ config, pkgs, nix-colors, nixvim,... }:

{
  imports = [
    ./configs
    nix-colors.homeManagerModules.default
    nixvim.homeManagerModules.nixvim
  ];
  colorScheme = nix-colors.colorSchemes.tokyo-night-terminal-dark;

  home.username = "nocta";
  home.homeDirectory = "/home/nocta";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    btop git gh rustup dconf swww
    waybar rofi-wayland pavucontrol
    playerctl brightnessctl 
  ];
  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
  programs = {
    fish.enable = true;
    home-manager.enable = true;
    kitty.enable = true;
  };
}
