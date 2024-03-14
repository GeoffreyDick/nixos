{ config, pkgs, username, ... }:

{
	imports = [
		# ./shells
		# ./editors
	];

	home = {
		username = "${username}";
		homeDirectory = "/home/${username}";

		stateVersion = "23.11";
	};

	# Let Home Manager install and manage itself
	programs.home-manager.enable = true;
}
