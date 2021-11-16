#!/bin/sh
for arg in "$@"; do
  case "$arg" in
    -o | --output)
                  THEME_NAME="$2"
                  shift
                  shift
                  ;;
    -p | --path)
                THEME_PATH="$2"
                shift
                shift
                ;;
  esac
done
THEME_NAME=${THEME_NAME:=oomox-breeze-hacked}
THEME_PATH=${THEME_PATH:="${HOME}"/.icons}
THEME_PATH=${THEME_PATH}"/"${THEME_NAME}
mkdir /tmp/breeze-hacked-build
cp ./build.sh /tmp/breeze-hacked-build
cp -r ./src /tmp/breeze-hacked-build
. ~/.cache/wal/colors.sh
sed -i "s/#192629/${color0}/g ; s/#79f5f3/${color10}/g" /tmp/breeze-hacked-build/src/cursors.svg
/tmp/breeze-hacked-build/build.sh
echo "[Icon Theme]\nName=${THEME_NAME}\nComment=Breeze Cursor Theme" > /tmp/breeze-hacked-build/Breeze_Hacked/index.theme
cp -vr /tmp/breeze-hacked-build/Breeze_Hacked/* "${THEME_PATH}"
rm -rf /tmp/breeze-hacked-build
