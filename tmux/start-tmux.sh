#!/bin/sh

echo "Starting multiple tmux sessions"

tmuxp load -d config
tmuxp load -d pyspark-sandbox
tmuxp load -d aws-deploy
tmux new-session -s coding

tmux ls
