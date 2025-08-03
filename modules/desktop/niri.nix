{ pkgs, lib, config, ... }:
with lib; {
  options.zen.modules.niri.enable = mkEnableOption "To niri or not to niri";

  config = mkIf config.zen.modules.niri.enable {
    programs.niri = { enable = true; };

    # dependencies .w.
    environment.systemPackages = [
      pkgs.kdePackages.qt6ct
      pkgs.kdePackages.breeze
      pkgs.brightnessctl
      pkgs.hyprsunset
      pkgs.trashy
      pkgs.fuzzel
      pkgs.wl-screenrec
      pkgs.libnotify
      pkgs.swappy
      pkgs.imv
      pkgs.wayfreeze
      pkgs.networkmanagerapplet
      pkgs.ripdrag
      pkgs.seahorse
      pkgs.rembg
    ];

    # I could write a hypersunrise service to conflict but fuck it better to just
    # make a keybind to stop the service lol And I am less likely to forget to
    # turn the darn thing off if its right on my face
    systemd.user.timers.hyprsunset = {
      description = "Start hyprsunset after sunset";
      enable = true;
      wantedBy = [ "timers.target" ];
      timerConfig = { OnCalendar = "*-*-* 17:30:00"; };
    };

    systemd.user.services.hyprsunset = {
      enable = true;
      description = "starts hyprsunset for blue light filtering";
      after = [ "graphical.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset -t 3000";
      };
    };

    # for whatever reason swappy likes to open images
    # don't let that fucker open images
    xdg.mime.defaultApplications = {
      "image/jpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
    };

  };
}
