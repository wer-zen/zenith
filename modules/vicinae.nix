{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  qt6,
  kdePackages,
  openssl,
  cmark-gfm,
  libqalculate,
  minizip,
  abseil-cpp,
  protobuf,
}:
stdenv.mkDerivation rec {
  pname = "vicinae";
  version = "0.0.5"; # Update to latest

  src = fetchurl {
    url = "https://github.com/vicinaehq/vicinae/releases/download/v${version}/vicinae-linux-x86_64-v${builtins.replaceStrings ["."] [""] version}.tar.gz";
    sha256 = "0mg6pwqvsk7ggd57vrxvm1fa9sxd6bnw6naz62vyfxxg07g35dd2"; # Update hash
  };

  nativeBuildInputs = [autoPatchelfHook qt6.wrapQtAppsHook];
  buildInputs = with qt6; [
    qtbase
    qtsvg
    qttools
    qtwayland
    qtdeclarative
    qt5compat
    kdePackages.qtkeychain
    kdePackages.layer-shell-qt
    openssl
    cmark-gfm
    libqalculate
    minizip
    stdenv.cc.cc.lib
    abseil-cpp
    protobuf
  ];

  unpackPhase = "tar -xzf $src";
  installPhase = ''
    mkdir -p $out/bin $out/share/applications
    cp bin/vicinae $out/bin/
    cp share/applications/vicinae.desktop $out/share/applications/
    chmod +x $out/bin/vicinae
  '';

  meta = {
    description = "Focused launcher for desktop";
    homepage = "https://github.com/vicinaehq/vicinae";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
