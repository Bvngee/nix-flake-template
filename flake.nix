{
  description = "BvngeeCord's Nix Flake Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils"; # easy system enumeration
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          default = pkgs.callPackage ./default.nix;
        };

        devShells = {
          # default = pkgs.mkShell {
          #  name = "";
          #  packages = with pkgs; [ ];
          # };
        };

      });
}
