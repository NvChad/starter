{
  description = "NvChad configuration as a NixOS flake",

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  },

  outputs = { nixpkgs, self }@inputs:
  let
    system = nixpkgs.lib.getSystemConfiguration {};
  in
  {
    nixConfig = nixpkgs.lib.nixosSystem {
      title = "nvim-config";
      system = system;
      modules = [
        # Module that makes the nvim config available
        {
          # Add the nvim config to the home manager
          home.packages = pkgs: with pkgs; [
            neovim
          ];
        }
        # You can import additional modules here
      ];
    };

    # Also expose the flake for use as an input
    devShells = {
      # Example dev shell
      # nvim-dev = pkgs.mkShell {
      #   buildInputs = [ neovim ];
      # };
    };
  };
}