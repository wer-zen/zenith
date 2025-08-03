{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.zen.modules.navigation.yazi;
in {
  options.zen.modules.navigation.yazi = {
    enable = mkEnableOption "Description";

  };

  config = mkIf cfg.enable {

    programs.yazi = {
      enable = true;
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "mtime";
          sort_dir_first = true;
          sort_reverse = true;
        };
      };
    };

  };
}
