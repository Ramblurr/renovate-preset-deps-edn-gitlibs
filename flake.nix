{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # tracks nixpkgs unstable branch
    flakelight.url = "github:nix-community/flakelight";
    flakelight.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    { self
    , flakelight
    , home-manager
    , ...
    }@inputs:
    flakelight ./. (
      { config, ... }:
      {
        devShell = pkgs: {
          packages = [
            pkgs.renovate
          ];
        };
        checks = {
          renovate-config-validator = { renovate, ... }: "${renovate}/bin/renovate-config-validator *.json";
        };
      }
    );
}
