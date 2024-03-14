{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
    	url = "github:nix-community/home-manager/release-23.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
	url = "github:nix-community/NixOS-WSL";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  	with inputs; let
  		inherit (self) outputs;
  		username = "geoff";
  in {
    # Host configurations
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixos.nix

	home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
        	home-manager.useUserPackages = true;
            	home-manager.extraSpecialArgs = inputs;
            	home-manager.users."${username}" = import ./home;
	}
      ];
      extraSpecialArgs = { inherit inputs outputs; };
    };
  };
}
