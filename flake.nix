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
      flower-power = with python.pkgs; buildPythonPackage {
        name = "flower-power";
        src = ./.;
        propagatedBuildInputs = [
          requests
        ];
      };
    in flake-utils.lib.eachDefaultSystem (system: {
      defaultPackage = flower-power;
      devShell = pkgs.mkShell {
        buildInputs = [
          (python.withPackages (ps: [ flower-power ]))
        ];
      };
    });
}
