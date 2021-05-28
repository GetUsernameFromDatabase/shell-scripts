#!/bin/bash
# Do this before "chmod +x ./manjaro.sh"
set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "this script needs sudo priviledges"

echo "installing pacman apps"
sudo pacman -Syu
while read -r a ; do sudo pacman -S $a --noconfirm --needed; done < <(cat << "EOF"
    seahorse
    discord
    fish
    ttf-fira-code
    torbrowser-launcher
    libreoffice-fresh
    nodejs npm
    wine
EOF
)
sudo pacman -S --noconfirm --asdeps --needed $(pacman -Si wine | sed -n '/^Opt/,/^Conf/p' | sed '$d' | sed 's/^Opt.*://g' | sed 's/^\s*//g' | tr '\n' ' ')

echo "installing snap apps"
sudo snap refresh
while read -r a ; do sudo snap install $a; done < <(cat << "EOF"
    code --classic
    teams
    spotify
EOF
)
