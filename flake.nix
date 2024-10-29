{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim = {url = "github:nix-community/nixvim"; inputs.nixpkgs.follows = "nixpkgs";};
  };

  outputs = { nixpkgs, home-manager, nix-colors, nixvim, ...} @ inputs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./system/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nocta = import ./home/home.nix;
            home-manager.extraSpecialArgs = {inherit nix-colors; inherit nixvim; inherit inputs;};
          }
        ];
      };

  };
}
