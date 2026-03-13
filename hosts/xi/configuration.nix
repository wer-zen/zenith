# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d"; # adjust retention as needed
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  nixpkgs.config.allowUnfree = true;
  services.blueman.enable = true;

  security.sudo.wheelNeedsPassword = false;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.graphics.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "flow"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

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

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.zen = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  services.mpd.enable = true;

  programs.firefox.enable = true;
  programs.niri.enable = true;
  services.auto-cpufreq = {enable = true;};

  environment.systemPackages = with pkgs; [
    helix
    neovim
    ly
    inputs.zen-browser.packages."${system}".default
    inputs.quickshell.packages."${pkgs.system}".default
    inputs.noctalia.packages.${system}.default
    inputs.affinity-nix.packages.x86_64-linux.v3
    bibata-cursors
    foot
  ];

  system.stateVersion = "25.05";
}
