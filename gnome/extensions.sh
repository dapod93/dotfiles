#!/bin/bash
# GNOME Extensions installation script

echo "Installing GNOME Extensions..."

# Create the extensions directory if it doesn't exist
mkdir -p ~/.local/share/gnome-shell/extensions

# Array of your extension UUIDs (Find UUID in metadata.json)
EXTENSIONS=(
    "dash-to-dock@://gmail.com"
    "blur-my-shell@aunetx"
)

# Loop and enable/install via tool or local files
for ext in "${EXTENSIONS[@]}"; do
    echo "Installing $ext..."
    gnome-extensions install "$ext"
    gnome-extensions enable "$ext"
done

echo "Done install GNOME Extensions..."
