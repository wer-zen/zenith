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
  icu,
}:
stdenv.mkDerivation rec {
  pname = "vicinae";
  version = "0.20.8"; # Check https://github.com/vicinaehq/vicinae/releases for latest

  src = fetchurl {
    url = "https://github.com/vicinaehq/vicinae/releases/download/v0.20.8/vicinae-linux-x86_64-v0.20.8.tar.gz";
    sha256 = "sha256-cdynHqMP7C75V2fry6Z5OWSVIssT3ZATspycXau3Mg0=";
  };

  nativeBuildInputs = [autoPatchelfHook qt6.wrapQtAppsHook];
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
      syntax-highlighting
    ])
    ++ [
      openssl
      cmark-gfm
      libqalculate
      minizip
      stdenv.cc.cc.lib
      abseil-cpp
      protobuf
      icu
    ];

  autoPatchelfIgnoreMissingDeps = ["libicuuc.so.78"];

  postFixup = ''
    mkdir -p $out/lib
    ln -s ${icu}/lib/libicuuc.so.76 $out/lib/libicuuc.so.78
    ln -s ${icu}/lib/libicudata.so.76 $out/lib/libicudata.so.78
    ln -s ${icu}/lib/libicui18n.so.76 $out/lib/libicui18n.so.78

    patchelf --add-rpath $out/lib $out/libexec/vicinae/vicinae-server
    patchelf --add-rpath $out/lib $out/libexec/vicinae/.vicinae-server-wrapped
  '';
  unpackPhase = "tar -xzf $src --strip-components=1";
  installPhase = ''
    mkdir -p $out/bin $out/libexec/vicinae $out/share/applications $out/share/icons
    cp -r bin/* $out/bin/
    cp -r libexec/* $out/libexec/ 2>/dev/null || true
    cp -r share/* $out/share/ 2>/dev/null || true
    chmod +x $out/bin/vicinae
    chmod +x $out/libexec/vicinae/vicinae-server 2>/dev/null || true
  '';
  meta = with lib; {
    description = "Raycast-like launcher for Linux";
    homepage = "https://github.com/vicinaehq/vicinae";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [];
  };
}
