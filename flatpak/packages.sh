#!/bin/bash
# Flatpak apps installation script

set -euo pipefail

echo "Installing flatpak apps..."

# Setup flathub in flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install apps
flatpak install -y flathub com.getpostman.Postman
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.mongodb.Compass
flatpak install -y flathub com.redis.RedisInsight
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub io.dbeaver.DBeaverCommunity
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub rest.insomnia.Insomnia

# Only if using GNOME
# flatpak install -y flathub com.mattjakeman.ExtensionManager

# Only if u want to play Minecraft
# flatpak install -y flathub com.modrinth.ModrinthApp

echo "Done installing flatpak apps"
