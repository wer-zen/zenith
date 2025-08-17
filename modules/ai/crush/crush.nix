{ config, lib, inputs, pkgs, ... }:
with lib;
let cfg = config.zen.modules.ricing.crush.crush;
in {
  options.zen.modules.ricing.crush.crush = {
    enable = mkEnableOption "enable crush";
  };

  imports = [ inputs.crush.packages.x86_64-linux.default ];
  config = mkIf cfg.enable {

    programs.crush.enable = true;

  };
}
