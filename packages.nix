{ pkgs, ... }:

with pkgs; [
  # >>"Hello, world!" when run.<<
  hello

  # >>DEV<<
  rustup
  ghostty
  neofetch
  zathura
  xwayland-satellite
  gcc
  logseq
  git
  ruby
  nodejs
  vue
  ruby
  nodejs
  cheese
  vue
  chawan
  steam
  gnome-font-viewer
  steam
  yarn
  blueman
  lua
  bun
  lazygit
  lua-language-server
  astro-language-server
  basilk
  tre-command
  wl-clipboard-rs
  pay-respects
  go
  python3
  opencode
  gnome-clocks
  zed-editor
  gnome-calculator

  kitty
  foot
  oh-my-posh
  tmux
  zellij
  yazi
  equibop
  eza
  obsidian

  # >>MUSIC<<
  easyeffects
  cava

  # >>NAVIGATION<<
  fzf
  ulauncher
  zoxide
  wofi
  eza
  nautilus

  # >>SYSTEM UTILITIES<<
  wget
  mission-center
  auto-cpufreq
  btop
  unzip
  killall
  tree
  bat
  hyprpicker
  gnome-software

  # >>IDK<<
  equibop
  swaynotificationcenter
  inkscape

  # >>WALLPAPER & CUSTOMIZATION & SCREENUTILS<<
  hyprshot
  grim
  fastfetch
  swww
  hyprlock
  slurp
  clock-rs
  gpu-screen-recorder

  # >>QUICKSHILL<<

  kdePackages.qtbase
  kdePackages.qtdeclarative
  kdePackages.qtmultimedia
  qt6Packages.qt5compat
  kdePackages.networkmanager-qt
  kdePackages.kirigami
  libsForQt5.kirigami2
  libsForQt5.networkmanager-qt
  qt6.qtdeclarative
  qt6.qtmultimedia
  # >>FISH<<
  fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fishPlugins.grc
  fish
  grc
  flat-remix-gtk
]
