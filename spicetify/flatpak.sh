#!/bin/bash

echo "Run spicetify installation for flatpak spotify"

curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh |
    sed '/echo "Do you want to install spicetify Marketplace? (Y\/n)"/,$d' |
    sh

curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh

sudo mv $HOME/.spicetify/spicetify /usr/bin

spicetify config spotify_path "/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify"
spicetify config prefs_path $HOME/.var/app/com.spotify.Client/config/spotify/prefs

sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

spicetify backup apply

echo "Done installing spicetify for flatpak spotify..."
