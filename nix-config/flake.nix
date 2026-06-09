{
  description = "globalTools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "shyweedsTools";

      paths = with pkgs; [
        cmake
        claude-code
        shellharden
        shellcheck
        vscode
        qemu
        cava
      ];
    };
  };
}
