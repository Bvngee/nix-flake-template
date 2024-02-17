{
  description = "BvngeeCord's Nix Flake Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, systems, ... }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
      pkgsFor = eachSystem (system: import nixpkgs { localSystem = system; });
    in
    {
      packages = eachSystem (system: {
        #default = pkgsFor.${system}.callPackage ./default.nix;
      });

      devShells = eachSystem (system: {
        #default = pkgsFor.${system}.mkShell {
        #  name = "something";
        #  packages = with pkgsFor.${system}; [ ];
        #};
      });
    };
}
