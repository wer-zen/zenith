{
  stdenv,
  lib,
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
  version = "0.16.9"; # Check https://github.com/vicinaehq/vicinae/releases for latest

  src = fetchurl {
    url = "https://github.com/vicinaehq/vicinae/releases/download/v${version}/vicinae-linux-x86_64.tar.gz";
    sha256 = lib.fakeSha256; # Will fail first time - see below
  };

  nativeBuildInputs = [autoPatchelfHook];
  buildInputs = with qt6;
    [
      qtbase
      qtsvg
      qtdeclarative
      qtwayland
    ]
    ++ (with kdePackages; [
      layer-shell-qt
      qtkeychain
    ])
    ++ [
      openssl
      cmark-gfm
      libqalculate
      minizip
      stdenv.cc.cc.lib
      abseil-cpp
      protobuf
    ];

  unpackPhase = "tar -xzf $src --strip-components=1";
  installPhase = ''
    mkdir -p $out/bin $out/share/applications $out/share/icons
    cp -r bin/* $out/bin/
    cp -r share/* $out/share/ 2>/dev/null || true
    chmod +x $out/bin/vicinae
  '';

  meta = with lib; {
    description = "Raycast-like launcher for Linux";
    homepage = "https://github.com/vicinaehq/vicinae";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [];
  };
}
