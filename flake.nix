{
  description = "ZenFlow NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    hjem-impure.url = "github:Rexcrazy804/hjem-impure";
    wallpapers = {
      url = "git+file:///home/zen/Wallpapers";
      flake = false;
    };
    vicinae.url = "github:vicinaehq/vicinae";
    noctalia = {
      url = "github:/noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swiftfetch = {
      url = "github:ly-sec/swiftfetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    durdraw = {
      url = "github:scottmckendry/durdraw/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen.url = "github:InioX/Matugen";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.url = "github:feel-co/hjem";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    durdraw,
    stylix,
    nixpkgs,
    nur,
    swiftfetch,
    ...
  } @ inputs: {
    nixosConfigurations = {
      phi = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          users = ["zen"];
        };

        modules = [
          ./hosts/phi/configuration.nix
          ./modules
          ./users/zen.nix
        ];
      };
    };
  };
}
