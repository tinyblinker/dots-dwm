{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.devShells.ostep-py38 = lib.mkOption {
    type = lib.types.package;
  };

  config.devShells.ostep-py38 = pkgs.mkShellNoCC {
    packages = [
      pkgs.python310
    ];
  };
}
