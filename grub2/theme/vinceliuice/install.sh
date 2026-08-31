#!/bin/bash

set -euo pipefail

DRY_RUN=false

# Parse arguments
case "${1:-}" in
--dry-run)
    DRY_RUN=true
    ;;
"") ;;
*)
    echo "Usage: $0 [--dry-run]"
    exit 1
    ;;
esac

# Cache the sudo creds
sudo -v

# Keep sudo alive while the script is running
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" 2>/dev/null || exit
done 2>/dev/null &

SUDO_KEEPALIVE_PID=$!
trap "kill $SUDO_KEEPALIVE_PID" 2>/dev/null || 'true' EXIT

echo "Run grub2 theme installation script..."

rm -rf grub2-themes

git clone git@github.com:vinceliuice/grub2-themes.git

if [[ "$DRY_RUN" == true ]]; then
    echo "Dry run: generating theme instead of installing it..."
    sudo ./grub2-themes/install.sh \
        -t whitesur \
        -s 2k \
        -g ./grub2-theme-generated
else
    sudo ./grub2-themes/install.sh \
        -t whitesur \
        -s 2k
fi

rm -rf grub2-themes

echo "Done installing grub2 theme..."
