{
  description = "Hyprland on NixOS ";

  # ===========================================================================
  # INPUTS
  # ===========================================================================

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
      home-manager = {
          url = "github:nix-community/home-manager/release-26.05";
          inputs.nixpkgs.follows = "nixpkgs"; 
      };
      zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  # ===========================================================================
  # OUTPUTS
  # ===========================================================================

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
              ./configuration.nix
              home-manager.nixosModules.home-manager
              {
                   home-manager = {
                        useGlobalPkgs   = true;   # Reutiliza nixpkgs del sistema
                        useUserPackages = true;
                        users.edu       = import ./home.nix;
                  };
              }
          ];
      };
  };
}
