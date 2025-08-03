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
  # hjem
  programs.fish.enable = true;
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;
    
    files = let
      matugen = config.modules.matugen;
      matugenTheme = matugen.theme.files;

      qt6ct = let
        from = [ "/home/zen" ];
        to = [ "${config.users.users.${username}.home}" ];
      in builtins.replaceStrings from to
      (builtins.readFile ./zendots/qt6ct/qt6ct.conf);

    in {
       # fish
            ".config/fish/config.fish".source = ./zendots/fish/config.fish;

            # bat
            ".config/bat/config".source = ./zendots/bat/config;

            # foot terminal
            ".config/foot/foot.ini".source = ./zendots/foot/foot.ini;

            # hyprland
            ".config/yazi/yazi.toml".source = ./zendots/yazi/yazi.toml;
            ".config/yazi/keymap.toml".source = ./zendots/yazi/keymap.toml;
            ".config/yazi/theme.toml".source = "${matugenTheme}/yazi-theme.toml";

            # quickshell
            ".config/quickshell".source = "../zenflow";

            # discord
            ".config/equibopq/themes/midnight.css".source =
              "${matugenTheme}/discord-midnight.css";
      
    };
  };
}

