#!/bin/bash
export DISPLAY=:0.0
echo "tmux new & execute"
tmux new -d -s tmux_detect_session 'bash ./Execute.sh'
echo "tmux detach"
tmux detach
