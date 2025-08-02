{ pkgs, ... }:

with pkgs; [
  # >>"Hello, world!" when run.<<
  hello

  # >>DEV<<
  rustup
  ghostty
  neofetch
  zathura
  gcc
  logseq
<<<<<<< HEAD
  git
  ruby
  nodejs
  vue
=======
  ruby
  nodejs
  vue
  chawan
>>>>>>> 8923724c34fbc7f2af9a244bfd85f0faa5a9fa3e
  steam
  gnome-font-viewer
  yarn
  blueman
  lua
  bun
  lazygit
  lua-language-server
  astro-language-server
<<<<<<< HEAD
=======
  basilk
>>>>>>> 8923724c34fbc7f2af9a244bfd85f0faa5a9fa3e
  tre-command
  wl-clipboard-rs
  pay-respects
  go

  python3
  opencode
  gnome-clocks
  zed-editor
  gnome-calculator
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
  qt6Packages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  kdePackages.qtbase
  kdePackages.qtdeclarative

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
