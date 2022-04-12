{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      projectDir = ./.;
      overlay = self: super: {
        flower-power = with super.python.pkgs;
          buildPythonPackage {
            name = "flower-power";
            src = ./.;
            propagatedBuildInputs = [ requests ];
          };
      };
      defaultPython = pkgs.python38;
      finalPython = defaultPython.override { packageOverrides = overlay; };
    in flake-utils.lib.eachDefaultSystem (system: {
      inherit overlay;
      defaultPackage = finalPython.pkgs.flower-power;
      devShell = pkgs.mkShell {
        buildInputs = [ (finalPython.withPackages (ps: [ ps.flower-power ])) ];
      };
    });
}
