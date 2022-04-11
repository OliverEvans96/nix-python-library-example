{
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs-unstable, flake-utils }:
    let
      pkgs = nixpkgs-unstable.legacyPackages.x86_64-linux;
      projectDir = ./.;
      python = pkgs.python38;
      package = python.pkgs.buildPythonPackage {
        name = "flower-power";
        src = ./.;
      };
    in flake-utils.lib.eachDefaultSystem (system: {
      defaultPackage = package;
      devShell = package.env;
    });
}
