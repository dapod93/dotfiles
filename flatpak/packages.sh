#!/bin/bash
# Install flatpak apps

set -euo pipefail

# Setup flathub in flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install apps
flatpak install flathub com.getpostman.Postman
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub com.mongodb.Compass
flatpak install flathub com.redis.RedisInsight
flatpak install flathub com.spotify.Client
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub rest.insomnia.Insomnia

# Only if using GNOME
# flatpak install flathub com.mattjakeman.ExtensionManager

# Only if u want to play Minecraft
# flatpak install flathub com.modrinth.ModrinthApp
