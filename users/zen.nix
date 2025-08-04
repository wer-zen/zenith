{ inputs, pkgs, config, sources, lib, ... }:
let
  username = "zen";
  description = "To zen or not to Zen";
  flow = import ../packages.nix { inherit pkgs; };
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
    ricing.stylix.enable = true;
    ricing.matugen.matugen.enable = true;
  };

  # hjem
  programs.fish.enable = true;
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;

    files = let
      zenflow = ../../zenflow;
      matugen = config.modules.matugen.matugen;
      matugenTheme = matugen.theme.files;

    in {
      # fish
      ".config/fish/config.fish".source = ./zendots/fish/config.fish;
      # quickshell
      ".config/quickshell".source = zenflow + "/quickshell";

      # bat
      ".config/bat/config".source = ./zendots/bat/config;

      # foot terminal
      ".config/foot/foot.ini".source = ./zendots/foot/foot.ini;

      # niri
      ".config/niri/config.kdl".source = ./zendots/niri/config.kdl;

      # discord
      # ".config/equibopq/themes/midnight.css".source = "${matugenTheme}/discord-midnight.css";

      #zellij
      ".config/zellij/config.kdl".source = ./zendots/zellij/config.kdl;
      ".config/zellij/layouts/zenout.kdl".source =
        ./zendots/zellij/layouts/zenout.kdl;
      ".config/zellij/themes/zentheme.kdl".source =
        ./zendots/zellij/themes/zentheme.kdl;
    };
  };
}
