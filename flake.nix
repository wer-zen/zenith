{
  description = "ZenFlow NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    hjem-impure.url = "github:Rexcrazy804/hjem-impure";

    axctl.url = "github:Axenide/axctl";
    niri.url = "github:niri-wm/niri";
    niri-blur = {
      url = "github:niri-wm/niri/wip/branch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ... rest of your inputs unchanged
    vicinae.url = "github:vicinaehq/vicinae";
    noctalia = {
      url = "github:/noctalia-dev/noctalia-shell";
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
    hjem.url = "github:feel-co/hjem";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  outputs = {
    self,
    durdraw,
    nixpkgs,
    nur,
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

      xi = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          users = ["zen"];
        };
        modules = [
          ./hosts/xi/configuration.nix
          ./modules
          ./users/zen.nix
        ];
      };
    };
  };
}
