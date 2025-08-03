{ config, lib, inputs, pkgs, ... }:
with lib;
let cfg = config.zen.modules.ricing.durdraw.durdraw;
in {
  options.zen.modules.ricing.durdraw.durdraw = {
    enable = mkEnableOption "Enable durdraw ASCII art editor";
  };

  imports = [inputs.durdraw.packages.x86_64-linux.default];
  config = mkIf cfg.enable {
    
  };
}
