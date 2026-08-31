#!/bin/bash

echo "Run fedora installation scripts..."

# Install packages
./fedora/packages.sh

# Install flatpak
./flatpak/packages.sh

# Copy config to its appropriate location
cp .config/fish/config.fish ~/.config/fish
cp .config/starship/starship.toml ~/.config/starship
cp -r .config/fastfetch ~/.config

# Change default shell to fish
chsh -s $(which fish)

# Reboot for after installations
reboot

echo "Done running fedora installation scripts"
