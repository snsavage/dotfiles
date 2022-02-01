#!/bin/sh
#
# Attatch or create tmux session named the same as current directory.

session_name="$(basename "$PWD" | tr . -)"

session_exists() {
    tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_names$"
}

not_in_tmux() {
    [ -z "$TMUX" ]
}

if not_in_tmux; then
    tmux new-session -As "$session_name"
else
    if ! session_exists; then
        (TMUX='' tmux new-session -Ad -s "$session_name")
    fi
    tmux swith-client -t "$session_name"
fi

