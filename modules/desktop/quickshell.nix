{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.desktop.quickshell;
in {
  options.zen.modules.desktop.quickshell = {
    enable = mkEnableOption "Quickshell configuration";
  };

  config = mkIf cfg.enable {
    qt.enable = true;

      };
    };
  };

}
