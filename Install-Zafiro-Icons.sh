#!/bin/bash
#Creator: Adolfo Silerio a.k.a ZAYRONXIO
#mail: zayronxio@gmail.com
###########
#[en]Created required directories

set -euo pipefail 

TEMP_DIR=$(mktemp -d)
echo $TEMP_DIR
trap 'rm -rf "$TEMP_DIR"' EXIT  # Always clean up the temporary directory on success/fail

USER_ICONS_DIR="$HOME/.local/share/icons"

ZAFIRO_URL="https://github.com/zayronxio/Zafiro-icons/archive/refs/heads/master.zip"

# Remove previous installations of the icon
for old_version in \
    "Zafiro-icons-master" "Zafiro-Icons" "Zafiro-icons" \
    "Zafiro-icons-Dark" "Zafiro-Icons-Dark" "Zafiro-Icons-dark" "Zafiro-icons-dark" \
    "zafiro-icons-dark" "zafiro-Icons-dark" "zafiro-Icons-Dark" "zafiro-icons-Dark" \
    "Zafiro-icons-Light" "Zafiro-Icons-Light" "Zafiro-Icons-light" "Zafiro-icons-light" \
    "zafiro-icons-light" "zafiro-Icons-light" "zafiro-Icons-Light" "zafiro-icons-Light"; do
  if [ -d "$USER_ICONS_DIR/$old_version" ]; then
    rm -rf "$USER_ICONS_DIR/$old_version"
  fi
done


mkdir -p "$USER_ICONS_DIR"


cd "$TEMP_DIR"
wget -q --show-progress "$ZAFIRO_URL" -O master.zip
sleep 3s

if [ -f "master.zip" ]; then
  unzip master.zip 
  if [ -d "Zafiro-icons-master" ]; then
    cp -r "Zafiro-icons-master/Dark" "$USER_ICONS_DIR/Zafiro-Icons-Dark"
    cp -r "Zafiro-icons-master/Light" "$USER_ICONS_DIR/Zafiro-Icons-Light"
    cp "Zafiro-icons-master/CREDITS" "$USER_ICONS_DIR/Zafiro-Icons-Dark"
    cp "Zafiro-icons-master/CREDITS" "$USER_ICONS_DIR/Zafiro-Icons-Light"
    cp "Zafiro-icons-master/README.md" "$USER_ICONS_DIR/Zafiro-Icons-Light"
    cp "Zafiro-icons-master/README.md" "$USER_ICONS_DIR/Zafiro-Icons-Dark"
    cp "Zafiro-icons-master/LICENSE.md" "$USER_ICONS_DIR/Zafiro-Icons-Dark"
    cp "Zafiro-icons-master/LICENSE.md" "$USER_ICONS_DIR/Zafiro-Icons-Light"
    echo "---"
    echo "Zafiro Icons have been successfully installed."
    echo "Light theme: $USER_ICONS_DIR/Zafiro-Icons-Light"
    echo "Dark theme: $USER_ICONS_DIR/Zafiro-Icons-Dark"
    echo "Please select the desired theme in your system settings."
  else
    echo "no fue posible descomprimir archivo"
  fi
else
  echo "no fue posible descargar el archivo"
fi

