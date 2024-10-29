{config, ...}:
{
   environment.variables = {
        NIXOS_SYSTEM_CONFIG = "$HOME/sysconf";
   };

   hardware.graphics.enable = true;
   services.xserver.videoDrivers = ["nvidia"];
   hardware.nvidia = {

      # Modesetting is required.
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;


   };
}