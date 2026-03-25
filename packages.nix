{pkgs, ...}:
with pkgs; [
  # >>UTILITIES<<
  hello # prints "Hello, world!" when run
  wget
  unzip
  killall
  tree
  jq
  bat
  git
  nurl
  just
  inotify-tools
  notify-desktop
  ps_mem
  pay-respects
  alejandra

  # >>SYSTEM<<
  btop
  mission-center
  auto-cpufreq
  powertop
  powerstat
  sbctl
  os-prober

  # >>TERMINALS & MULTIPLEXERS<<
  ghostty
  foot
  tmux
  zellij

  # >>SHELLS<<
  nushell
  fish
  fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fishPlugins.grc
  grc
  oh-my-posh

  # >>NAVIGATION & FILE MANAGEMENT<<
  fzf
  zoxide
  eza
  yazi
  tre-command
  nautilus

  # >>EDITORS & LANGUAGE SERVERS<<
  helix
  zed-editor
  markdown-oxide
  nil
  gopls
  lua-language-server
  rust-analyzer
  clang-tools
  typescript-language-server
  astro-language-server
  biome

  # >>DEVELOPMENT<<
  gcc
  clang-tools
  cmake
  gnumake
  ninja
  go
  python3
  ruby
  lua
  nodejs
  pnpm
  yarn
  bun
  rustup
  rustlings
  cargo-generate
  typescript
  protobuf
  minizip
  libqalculate
  fontforge

  # >>DEVTOOLS<<
  gh
  lazygit
  aider-chat
  opencode
  prettier
  cmark-gfm

  # >>JAVA<<
  zulu25

  # >>BROWSERS<<
  qutebrowser
  brave
  chawan

  # >>LAUNCHERS<<
  fuzzel
  wofi

  # >>WAYLAND & DISPLAY<<
  wayland
  egl-wayland
  mesa
  libglvnd
  wl-clipboard-rs
  hyprpicker
  hyprshot
  grim
  slurp
  swww
  hyprlock

  # >>QT<<
  qt6.qtbase
  qt6.qtsvg
  qt6.qttools
  qt6.qtwayland
  qt6.qtdeclarative
  qt6.qtimageformats
  kdePackages.qtmultimedia
  kdePackages.qtshadertools
  kdePackages.syntax-highlighting
  rapidfuzz-cpp

  # >>NOTIFICATIONS<<
  swaynotificationcenter

  # >>THEMING & CUSTOMIZATION<<
  wallust
  flat-remix-gtk
  inkscape

  # >>MUSIC & AUDIO<<
  easyeffects
  cava

  # >>SCREENCAST & RECORDING<<
  gpu-screen-recorder

  # >>MEDIA & VIEWERS<<
  vlc
  zathura
  logseq
  obsidian

  # >>FONTS<<
  gnome-font-viewer

  # >>GNOME APPS<<
  gnome-keyring
  gnome-calendar
  gnome-clocks
  gnome-calculator

  # >>MISC APPS<<
  anki-bin
  appimage-run
  scrcpy
  cheese
  protonmail-desktop
  equibop
  brightnessctl
  playerctl
  basilk
  ollama

  # >>TERMINAL EYE CANDY<<
  fastfetch
  lavat
  asciiquarium-transparent
  cmatrix
  clock-rs
]
