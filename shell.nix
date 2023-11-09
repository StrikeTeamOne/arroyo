let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
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
}
