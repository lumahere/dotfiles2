# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system-packages.nix
      ./system-env.nix
    ];

  boot.loader.grub = { enable = true; device = "nodev"; efiSupport = true;};
  boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "nixos"; # Define your hostname.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

   time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   
   services.xserver.enable = true;
   services.displayManager.sddm.enable = true;

  
  #SOUND
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  #BLUETOOTH
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

   users.users.nocta = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox tree
       vscode
     ];
	  shell = pkgs.fish;

  };



  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}

