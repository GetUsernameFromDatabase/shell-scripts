#!/bin/bash
# Do this before "chmod +x ./manjaro.sh"
set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "this script needs sudo priviledges"

echo "installing pacman apps"
pacman -Syu
while read -r a ; do sudo pacman -S $a --noconfirm; done < <(cat << "EOF"
    discord
    fish
    ttf-fira-code
    torbrowser-launcher
EOF
)

echo "installing snap apps"
while read -r a ; do sudo snap install $a; done < <(cat << "EOF"
    code --classic
    teams
EOF
)
