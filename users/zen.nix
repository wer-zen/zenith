{ inputs, pkgs, config, sources, lib, ... }:
let
  username = "zen";
  description = "To zen or not to Zen";
  flow = import ../packages.nix { inherit pkgs; };
  wallpapers = inputs.wallpapers;
in {
  users.users.${username} = {
    inherit description;

    packages = flow;
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "multimedia" ];
  };
  imports = [ inputs.hjem.nixosModules.default ];

  zen.modules = {
    ricing.matugen.matugen = {
      enable = true;
      wallpaper = wallpapers + "/_star_wars.jpg";
    };
  };

  # hjem
  programs.fish.enable = true;
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;

    files = let
      zenflow = inputs.zenflow;
      matugen = config.zen.modules.ricing.matugen.matugen;
      matugenTheme = matugen.theme.files;

    in {
      # fish
      ".config/fish/config.fish".source = ./zendots/fish/config.fish;
      # quickshell
      ".config/quickshell".source = zenflow + "/quickshell";

      # bat
      ".config/bat/config".source = ./zendots/bat/config;

      # foot terminal

      # niri
      ".config/niri/config.kdl".source = ./zendots/niri/config.kdl;

      #zellij
      ".config/zellij/config.kdl".source = ./zendots/zellij/config.kdl;
      ".config/zellij/layouts/zenout.kdl".source =
        ./zendots/zellij/layouts/zenout.kdl;

      # matugen ->

      # discord
      ".config/equibop/themes/midnight.css".source =
        "${matugenTheme}/discord-midnight.css";

      ".config/yazi/yazi-theme.toml".source = "${matugenTheme}/yazi-theme.toml";
    };
  };
}
