{ nixos-wsl, username, ... }:

{

	wsl = {
		enable = true;
		defaultUser = username;
		startMenuLaunchers = true;
	};
}
