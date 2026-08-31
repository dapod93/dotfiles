#!/bin/bash
# GNOME Extensions installation script

echo "Installing GNOME Extensions..."

# Create the extensions directory if it doesn't exist
mkdir -p ~/.local/share/gnome-shell/extensions

# Array of your extension UUIDs (Find UUID in metadata.json)
EXTENSIONS=(
    auto-move-windows@gnome-shell-extensions.gcampax.github.com
    blur-my-shell@aunetx
    clipboard-history@alexsaveau.dev
    just-perfection-desktop@just-perfection
    system-monitor@gnome-shell-extensions.gcampax.github.com
    unite@hardpixel.eu
    unite@hardpixel.eu
    user-theme@gnome-shell-extensions.gcampax.github.com
)

# Loop and enable/install via tool or local files
for ext in "${EXTENSIONS[@]}"; do
    echo "Installing $ext..."
    gnome-extensions install "$ext"
    gnome-extensions enable "$ext"
done

echo "Done install GNOME Extensions..."
