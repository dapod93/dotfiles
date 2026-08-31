#!/bin/bash

echo "Run wgcf intallation..."

sudo curl -L https://github.com/ViRb3/wgcf/releases/download/v2.2.32/wgcf_2.2.32_linux_amd64 -o /usr/bin/wgcf
sudo chmod +x /usr/bin/wgcf

cd ~/Downloads

printf 'y\n' | wgcf register
wgcf generate

cd -

echo "Done installing wgcf..."
