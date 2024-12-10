{
  description = "Olas Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    # Configuration for `nixpkgs`
    nixpkgsConfig = {
      config = { allowUnfree = true; };
    };
  in
  {
    diskoConfigurations.brtfs-dual = import ./disk-config.nix;
    # Home manager standalone systems aka non nixOs linux
    homeConfigurations."ola" = home-manager.lib.homeManagerConfiguration {
      inherit (inputs.nixpkgs.legacyPackages."x86_64-linux") pkgs;
      modules = [
        ./home.nix
      ];

    };
  };
}
