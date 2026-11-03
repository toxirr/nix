{
	description = "flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};
	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.toxir = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix

				home-manager.nixosModules.home-manager
				{
					home-manager = {
  					useGlobalPkgs = true;
  					useUserPackages = true;
  					extraSpecialArgs = { inherit inputs; };
  					users = {
  					  toxir = import ./home.nix;
  					};
					};
				}
			];
		};
	};
}
