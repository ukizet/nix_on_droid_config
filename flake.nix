{
  description = "Nix-on-Droid flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-on-droid,
      ...
    }:
    let
      system = "aarch64-linux";
    in
    {
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs
      };
    };
}
