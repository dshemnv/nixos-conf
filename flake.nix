{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware configs
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Neovim configs
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake parts (modularity)
    # TODO: Use it ?
    # flake-parts = {
    #   	url = "github:hercules-ci/flake-parts";
    #   	inputs.nixpkgs-lib.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    flake-parts,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
        };

        modules = [
          ./sys/configuration.nix
          inputs.nixos-hardware.nixosModules.dell-xps-15-9500-nvidia
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.dshem = import ./home/hosts/home.nix;
          }
        ];
      };
    };
  };
}
