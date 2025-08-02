{ pkgs, lib, config, ... }:

with lib; {

  options.zen.programs.niri.enable = mkEnableOption "To niri or not to niri";
  config = mkIf config.zen.programs.niri.enable {
    programs.niri = { enable = true; };
  };
  qt.enable = true;

  programs.dconf.enable = true;

  # dependencies .w.
  environment.systemPackages = with lib; [
    # QT dep
    kdePackages.qt6ct
    kdePackages.breeze

    # utility
    wl-clipboard
    cliphist
    grim
    slurp
    brightnessctl
    hyprsunset
    trashy
    fuzzel
    wl-screenrec
    libnotify
    swappy
    imv
    wayfreeze
    networkmanagerapplet
    yazi
    ripdrag
    seahorse

    # quickshell dep
    quickshell
    rembg

    # supporting scripts
    scripts.kde-send
    scripts.gpurecording
    scripts.cowask
    scripts.npins-show
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

  services.gnome.gnome-keyring.enable = true;
}
