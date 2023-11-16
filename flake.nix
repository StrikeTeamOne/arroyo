{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  description = "A very basic flake";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        # Development environment output
        devShells = {
          default = pkgs.mkShell {
            # The Nix packages provided in the environment
            packages = with pkgs; [
              kubectl
              kubernetes-helm
              (google-cloud-sdk.withExtraComponents
                [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
              pkg-config
              openssl
              cmake
              curl
              postgresql
              protobuf
              nodejs
              nodejs.pkgs.pnpm
              wasm-pack
              jdk
            ];
          };
        };
        formatter = pkgs.nixfmt;
      });
}
