#!/bin/bash

# Install minimum packages
./packages.sh

# Install flatpak
./flatpak/packages.sh

# Copy fish config to its appropriate location
sudo cp .config/fish/config.fish ~/.config/fish

# Change default shell to fish
chsh -s $(which fish)
