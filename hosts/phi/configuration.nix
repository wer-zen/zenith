# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./user-configuration.nix
  ];
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
  nixpkgs.config.permittedInsecurePackages = [ "libsoup-2.74.3" ];
  services.xserver = {
    exportConfiguration = true; # link /usr/share/X11/ properly
    enable = true;
    layout = "us, it";
    xkbOptions = "eurosign:e, compose:menu, grp:alt_space_toggle";
  };
  nixpkgs.config.allowUnsupportedSystem = true;
  services.power-profiles-daemon.enable = false;
  systemd.user.units.swaync.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  services.flatpak.enable = true;

  services.blueman.enable = true;

  programs.nix-ld.enable = true;
  programs.dconf.enable = true;
  programs.nix-ld.libraries = with pkgs; [

    brotli
    glib
  ];

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script =
      "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo     ";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

  };

  environment.sessionVariables = {

    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.graphics.enable = true;

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "flow"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "nerd-fonts.jetbrains-mono" ];
    };
    packages = with pkgs; [
      fira-sans
      fira-code
      roboto
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      material-symbols
      material-icons
    ];
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zen = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    modules = {
      desktop.quickshell.enable = true;
      desktop.music.cava.cava = {
        enable = true;
        settings = {
          framerate = 90;
          overshoot = -90;
        };
      };
      desktop.apps.obsidian.enable = true;
      development.vscode.enable = true;
      development.zed-editor.enable = false;
      navigation.yazi.enable = true;
      terminal.tmux.tmux.enable = true;
      terminal.foot.foot.enable = true;
      terminal.kitty.kitty.enable = true;
      terminal.helix.helix.enable = true;
      terminal.zellij.zellij.enable = true;
      terminal.oh-my-posh.oh-my-posh.enable = true;
      ricing.stylix.enable = true;
      ricing.durdraw.durdraw.enable = true;
      ricing.matugen.matugen.enable = true;

    };

  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = false;
  services.displayManager.autoLogin.user = "zen";
  services.mpd.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.auto-cpufreq = { enable = true; };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    neovim
    ly
    inputs.matugen.packages.${system}.default
    inputs.zen-browser.packages."${system}".default
    kitty
  ];

  system.stateVersion = "25.05";

}
