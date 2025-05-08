{
  description = "Nix flake for BlazinLock (Hyprlock auto-theming)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "blazinlock";
          version = "1.1.0";

          src = pkgs.fetchFromGitHub {
            owner = "Thunder-Blaze";
            repo = "BlazinLock";
            rev = "critical";
            sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
          };

          nativeBuildInputs = [ pkgs.makeWrapper ];

          installPhase = ''
           echo "Installing to: $out"

          # Verify if $out exists and is correct
          mkdir -p $out
          if [ ! -d "$out" ]; then
            echo "Error: $out does not exist"
            exit 1
          fi

           # Copy blazinlock to the correct directory
           cp blazinlock $out/bin/blazinlock-raw
           chmod +x $out/bin/blazinlock-raw

           # Wrap the binary with environment variables
           makeWrapper $out/bin/blazinlock-raw $out/bin/blazinlock --set BLAZINLOCK_DATA_DIR $out/

           # Copy hyprlock config into the right place
           cp -r hyprlock $out/
          '';

          meta = with pkgs.lib; {
            description = "Auto Theming Hyprlock, compatible with Normal, Hyprdots and End4 Installations";
            homepage = "https://github.com/Thunder-Blaze/BlazinLock";
            license = licenses.mit;
            maintainers = with maintainers; [ ];
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.bash pkgs.coreutils pkgs.gnugrep pkgs.gawk pkgs.gnused pkgs.git ];
          shellHook = ''
            echo "Development shell for BlazinLock"
          '';
        };

        # Dependencies that are needed globally on the system
        environment.systemPackages = with pkgs; [
          hyprlock    # Hyprlock for screen locking
          playerctl   # For Music Widget
        ];
      }
    );
}

