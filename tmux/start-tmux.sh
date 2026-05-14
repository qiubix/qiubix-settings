#!/bin/sh

echo "Starting multiple tmux sessions"

tmuxp load -d config
# tmuxp load -d pyspark-sandbox
# tmuxp load -d aws-deploy
tmuxp load -d xfor
tmuxp load -d gim
tmuxp load -d ds-generic-experiment
tmuxp load -d side-hustle
tmuxp load -d data-platform
# tmux new-session -s coding

tmux ls
