# symlink dots to .config for rapid iteration
[group("extra")]
link target:
  #!/usr/bin/env bash
  set -euxo pipefail
  ROOT_DIR={{ justfile_directory() }}
  DOTS_DIR=$ROOT_DIR/users/zendots
  NIX_FILE=$ROOT_DIR/users/zen.nix
  function symlink() {
      if [[ -e "$2" && ! -L "$2" ]] ; then 
          echo "$2 exists and is not a symlink. Ignoring it." >&2
          return 1
      fi
      mkdir -p $(dirname $2)
      ln -sf "${DOTS_DIR}/$1" "$2"
  }
  TO_LINK=$(cat $NIX_FILE | 
    awk '/\.\/zendots\/{{ replace(target, '/', '\/') }}/ { 
      gsub(/\.source|"/, "", $1); 
      gsub(/\.\/zendots\/|;/, "", $3); 
      print $3","$1
    }')

  for LINK in $TO_LINK; do
    CONFIG_FILE=${LINK##*,}
    DOTS_FILE=${LINK%%,*}
    symlink $DOTS_FILE ~/$CONFIG_FILE
    echo "Linked $CONFIG_FILE to $DOTS_FILE"
  done;
