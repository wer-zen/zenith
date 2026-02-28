# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
  nixpkgs.config.permittedInsecurePackages = ["qtwebengine-5.15.19" "libsoup-2.74.3"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d"; # adjust retention as needed
  };
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wcm
      wf-shell
      wayfire-plugins-extra
    ];
  };
  powerManagement.powertop.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };
  services.gvfs.enable = true;
  services.xserver = {
    exportConfiguration = true; # link /usr/share/X11/ properly
    enable = true;
    xkb.layout = "us, it";
    xkb.options = "eurosign:e, compose:menu, grp:alt_space_toggle";
  };
  nixpkgs.config.allowUnsupportedSystem = true;
  services.power-profiles-daemon.enable = false;
  systemd.user.units.swaync.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  services.flatpak.enable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  nixpkgs.config.allowUnfree = true;
  services.blueman.enable = true;

  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld.enable = true;
  programs.dconf.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    brotli
    glib
  ];

  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo     ";
  };
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "12";
  };

  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "flow"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts.monospace = ["nerd-fonts.jetbrains-mono"];
    };
    packages = with pkgs; [
      fira-sans
      fira-code
      roboto
      jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      material-symbols
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
    extraGroups = ["networkmanager" "wheel"];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = false;
  services.displayManager.autoLogin.user = "zen";
  services.mpd.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  programs.niri.enable = true;
  services.auto-cpufreq = {enable = true;};

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    neovim
    ly
    inputs.zen-browser.packages."${system}".default
    inputs.quickshell.packages."${pkgs.system}".default
    inputs.noctalia.packages.${system}.default
    inputs.affinity-nix.packages.x86_64-linux.v3
    inputs.hyprland.packages.${system}.default
    bibata-cursors
    foot
  ];

  qt.enable = true;

  system.stateVersion = "25.05";
}
