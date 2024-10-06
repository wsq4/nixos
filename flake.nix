{
  description = "Siqi's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-ld = { 
        url = "github:Mic92/nix-ld";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nix-ld, nur, ... }@inputs: {
    nixosConfigurations.wsq-Linux = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nixpkgs.overlays = [ nur.overlay ]; }
        ./core/configuration.nix
                
        nix-ld.nixosModules.nix-ld
        { programs.nix-ld.dev.enable = true; }
        
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.wsq = import ./home/home.nix;
        }
      ];
    };
  };
}
