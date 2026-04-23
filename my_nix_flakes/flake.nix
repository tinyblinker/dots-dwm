{
  description = "Minimal modular devShell setup";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        inherit system;
      };

      # === 模块系统求值 ===
      eval = lib.evalModules {
        modules = [
          ./modules
          {
            _module.args = {
              inherit pkgs;
            };
          }
        ];
      };

    in
    {
      devShells.${system} = eval.config.devShells;
    };
}
