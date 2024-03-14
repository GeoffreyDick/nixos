{ config, pkgs, username, ... }:

{
	nixpkgs = {
		config = {
			allowUnfree = true;
		};
	};

	nix.settings = {
		experimental-features = "nix-command flakes";
		auto-optimise-store = true;
  	};

  # Install system packages
  environment.systemPackages = with pkgs; [
    git # Must be first
    neovim
    wget
    curl
  ];

  # Set the default editor to vim
  environment.variables.EDITOR = "neovim";



  users.users."${username}" = {
    isNormalUser = true;
    description = "${username}";
    # openssh.authorizedKeys.keys = [
        # Replace with your own public key
        # "ssh-ed25519 <some-public-key> ryan@ryan-pc"
    # ];
  };

}
