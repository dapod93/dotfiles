#!/bin/bash

# Install minimum packages
./fedora/packages.sh

# Install flatpak
./flatpak/packages.sh

# Copy config to its appropriate location
cp .config/fish/config.fish ~/.config/fish
cp .config/starship/starship.toml ~/.config/starship
cp -r .config/fastfetch ~/.config

# Change default shell to fish
chsh -s $(which fish)
