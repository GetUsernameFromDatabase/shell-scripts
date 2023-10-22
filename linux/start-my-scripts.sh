#!/bin/bash
#scriptBaseName="$(basename "$0")"
#scriptFileName="${scriptBaseName%.sh}"

session="interactable-scripts"
window=0

function sendCommands () {
        for command in "${commands[@]::${#commands[@]}-1}"; do
                        tmux send-keys -t $session:$window "$command; tmux wait-for -S tmuxCmd" C-m\; wait-for tmuxCmd
        done
        tmux send-keys -t $session:$window "${commands[@]: -1:1}" C-m
}

function newWindow(){
        i=$((window+1))
        tmux new-window -t $session:$i -n "$1"
        return $i
}

tmux new-session -d -s $session
tmux rename-window -t $session:$window "ASF"
commands=("sh *SENSITIVE_INFO*/ArchiSteamFarm/ArchiSteamFarm.sh")
sendCommands

window=$(newWindow "Discord_Server_Bot")
commands=("source ~/.bashrc" "cd *SENSITIVE_INFO*/discord-server-bot/" "git checkout ." "git pull" "npm ci" "npm start")
sendCommands
