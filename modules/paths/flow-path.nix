# >>root:/home/modules/custom/flow-path.nix<<
{ config, lib, ... }:

let
  inherit (lib) types mkOption;
in
{
  options.dotfilesPath = mkOption {
    description = "Location of the dotfiles working copy";
    default = "${config.xdg.homeDirectory}/zenith";
    type = types.path;
    apply = toString;
  };
}
