{
  description = "vscode-tasks-cli";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-22.05";
  };

  outputs = {...} @ inputs: let
    system = "x86_64-linux";
    lib = inputs.nixpkgs-stable.lib;

    pkgs = import inputs.nixpkgs-stable {
      inherit system;
      overlays = [];
    };
  in rec
  {
    devShell.${system} = pkgs.mkShell {
      packages = with pkgs; [
        go_1_17

        # Go tools
        gopls
        gopkgs
        go-outline
        gotests
        delve
        go-tools
        gomodifytags
        impl
        golangci-lint

        # Formatting
        treefmt
        gofumpt
        alejandra
      ];
    };
  };
}
