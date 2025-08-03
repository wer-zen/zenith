{ config, pkgs, ... }:

let gitLibsecret = pkgs.git.override { withLibsecret = true; };
in {
  programs.git = {
    enable = true;
  };
}
