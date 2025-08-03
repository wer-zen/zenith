# >>root:/home/modules/desktop/<<
{ pkgs, ... }:

{
  imports = [
    ./quickshell.nix
    ../paths/flow-path.nix
    ./niri.nix
  ]; # global
  environment.systemPackages = [ pkgs.git pkgs.nixvim ];

  environment.variables.EDITOR = "nvim";
  environment.variables.MANPAGER = "nvim +Man!";
  programs.nano.enable = false;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security.sudo = {
    execWheelOnly = true;
    extraRules = [{
      users = [ "zen" ];
      # lets me rebuild without having to enter the password
      commands = [{
        command = "/run/current-system/sw/bin/nixos-rebuild";
        options = [ "SETENV" "NOPASSWD" ];
      }];
    }];
  };
}
