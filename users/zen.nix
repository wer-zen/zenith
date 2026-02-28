{
  inputs,
  pkgs,
  config,
  sources,
  lib,
  ...
}: let
  username = "zen";
  description = "To zen or not to Zen";
  flow = import ../packages.nix {inherit pkgs;};
  wallpapers = inputs.wallpapers;
in {
  users.users.${username} = {
    inherit description;

    packages = flow;
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = ["extra" "networkmanager" "wheel" "multimedia"];
  };
  imports = [inputs.hjem.nixosModules.default];

  programs.fish.enable = true;
  # hjem
  hjem.extraModules = [
    inputs.hjem-impure.hjemModules.default # imports the hjemModule
  ];

  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;

    impure = {
      enable = true; # enable hjem-impure
      dotsDir = "${./zendots}"; # pure path to dotsFolder AS STRING
      dotsDirImpure = "/home/zen/zenith/users/zendots"; # impure absolute path to dots folder
    };

    xdg.config.files = let
      dots = config.hjem.users.${username}.impure.dotsDir;
    in {
      # fish
      "fish/config.fish".source = dots + "/fish/config.fish";

      # bat
      "bat/config".source = dots + "/bat/config";

      # niri
      "niri/config.kdl".source = dots + "/niri/config.kdl";

      #zellij
      "zellij/config.kdl".source = dots + "/zellij/config.kdl";
      "zellij/layouts/zenout.kdl".source = dots + "/zellij/layouts/zenout.kdl";

      "helix/config.toml".source = dots + "/helix/config.toml";
      "helix/languages.toml".source = dots + "/helix/languages.toml";
    };
  };
}
