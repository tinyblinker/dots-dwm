{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.devShells.xv6 = lib.mkOption {
    type = lib.types.package;
  };

  config.devShells.xv6 = pkgs.mkShellNoCC {
    packages = with pkgs; [
      git
      gnumake
      qemu
      gdb

      pkgsCross.riscv64-embedded.buildPackages.gcc
    ];

    shellHook = ''
      export QEMU_AUDIO_DRV=none
    '';
  };
}
