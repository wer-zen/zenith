# >>root:/home/modules/desktop/<<
{ pkgs, ... }:

{
  imports = [
    ../paths/flow-path.nix
    ./niri.nix
  ]; # global
}
