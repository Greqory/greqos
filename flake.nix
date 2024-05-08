{
  description = "GreqOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-hardware, ... }:
  let
    system = "x86_64-linux";
    host = "hypr-lappy";
    inherit (import ./hosts/${host}/options.nix) username hostname;


    pkgs = import nixpkgs {
      inherit system;
      config = {
	    allowUnfree = true;
      };
    };

  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
	      specialArgs = { 
          inherit system; inherit inputs;
          inherit username; inherit hostname;
          inherit host;
        };
	      modules = [ 
	        ./system.nix
          home-manager.nixosModules.home-manager {
	          home-manager.extraSpecialArgs = {
	            inherit username; inherit inputs;
              inherit host;
              inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
            };
	          home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
	          home-manager.users.${username} = import ./users/default/home.nix;
	        }
	      # Custom content for t480:
	      nixos-hardware.nixosModules.lenovo-thinkpad-t480
	      ];
      };
    };
  };
}
