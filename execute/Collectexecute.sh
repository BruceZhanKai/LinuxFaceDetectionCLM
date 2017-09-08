#!/bin/bash
export DISPLAY=:0.0
echo "tmux new & execute"
tmux new -d -s tmux_collect_session 'bash ./Execute.sh'
echo "tmux detach"
tmux detach
