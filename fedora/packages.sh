#!/bin/bash
# Fedora packages installation script

set -euo pipefail

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

echo "Installing fedora packages ..."

# Install build essentials
sudo dnf group install -y c-development development-tools

# Install minimum used packages
sudo dnf install -y \
    bat \
    btop \
    cascadia-mono-nf-fonts \
    eza \
    fish \
    git \
    nvtop \
    make \
    ugrep

# Install 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://downloads.1password.com/linux/keys/1password.asc" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password

# Install starship
curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

# Install dotenv linter
curl -sSfL https://git.io/JLbXn | sudo sh -s
sudo mv bin/dotenv-linter /usr/bin
sudo rm -rf bin

# Install goenv
curl -sfL https://raw.githubusercontent.com/go-nv/goenv/main/install.sh | bash
sudo mv $HOME/.goenv/bin/goenv /usr/bin
goenv init
goenv completion fish --install
goenv install -y latest
goenv use --global latest

# Install all go binaries
go install entgo.io/ent/cmd/ent@latest
go install github.com/bufbuild/buf/cmd/buf@latest
go install github.com/segmentio/golines@latest
go install github.com/swaggo/swag/cmd/swag@latest
go install go install github.com/air-verse/air@latest

# Rehash goenv shims
goenv rehash

# Install global and activate pyvenv
python -m venv ~/.base
source $HOME/.base/bin/activate.fish
pip completion --fish >~/.config/fish/completions/pip.fish

# Install global python cli
python -m pip install pre-commit

# Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code

# Install docker
sudo dnf remove -y \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-engine \
    docker-engine-selinux \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux

sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y \
    containerd.io \
    docker-buildx-plugin \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin

sudo systemctl enable --now docker

# Docker post installations
sudo groupadd docker
sudo usermod -aG docker $USER

# Install teleport
curl https://cdn.teleport.dev/install.sh | bash -s "18.11.0" "oss"

# Install shfmt
sudo dnf copr enable -y flasheater/shfmt
sudo dnf install -y shfmt

# Install sink
sudo dnf copr enable -y nc1107/sink
sudo dnf install -y sink

# Install Zen browser
sudo dnf copr enable -y sneexy/zen-browser
sudo dnf install zen-browser

# Install Helium browser
dnf copr enable -y imput/helium
dnf install helium-bin

echo "Done installing fedora packages ..."
