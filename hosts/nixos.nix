{
	config,
	pkgs,
	inputs,
	...
}: {
	imports = [
		./common.nix
		../modules/wsl.nix
	];

	networking.hostName = "nixos";
	

	system.stateVersion = "23.11";
}
