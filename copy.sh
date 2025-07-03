#!/bin/bash

# Define source and destination base directories
SRC_DIR="$HOME/.config"
DEST_DIR=".config"

# Ensure destination base directory exists
mkdir -p "$DEST_DIR"

# List of folders to copy
FOLDERS=("alacritty" "dunst" "ghostty" "hypr" "nvim" "rofi" "wal" "waybar" "hyprpanel" "fish" "systemd" "mpv" "btop")

# Loop through each folder
for folder in "${FOLDERS[@]}"; do
  SOURCE_PATH="$SRC_DIR/$folder"
  DEST_PATH="$DEST_DIR/$folder"

  # Check if the source folder exists
  if [ -d "$SOURCE_PATH" ]; then
    echo "Copying $SOURCE_PATH to $DEST_PATH..."
    mkdir -p "$DEST_PATH"
    cp -r "$SOURCE_PATH/"* "$DEST_PATH/"
    echo "Copied $folder successfully."
  else
    echo "Warning: $SOURCE_PATH does not exist. Skipping."
  fi
done

SCRIPTS=("waybar_reload" "swww_change" "wall_select" "toggle_wifi")
SCRIPT_SRC_DIR="$HOME/.local/bin"
SCRIPT_DEST_DIR="scripts"

# Ensure destination scripts directory exists
mkdir -p "$SCRIPT_DEST_DIR"

# Loop through each script
for script in "${SCRIPTS[@]}"; do
  SCRIPT_SRC="$SCRIPT_SRC_DIR/$script"
  SCRIPT_DEST="$SCRIPT_DEST_DIR/$script"

  if [ -f "$SCRIPT_SRC" ]; then
    echo "Copying $SCRIPT_SRC to $SCRIPT_DEST..."
    cp "$SCRIPT_SRC" "$SCRIPT_DEST"
    echo "Copied $script successfully."
  else
    echo "Warning: $SCRIPT_SRC does not exist. Skipping."
  fi
done

echo "All specified folders and scripts processed."
