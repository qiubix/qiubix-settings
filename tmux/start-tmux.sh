#!/bin/sh

set -eu

# Space-separated tmuxp config names; shared sessions start in every mode.
shared_sessions="config"
work_sessions="xfor gim data-platform"
personal_sessions="side-hustle"

usage() {
    echo "Usage: start-tmux [work|personal|all]"
}

if [ "$#" -gt 1 ]; then
    usage >&2
    exit 1
fi

mode=${1-}
if [ "$#" -eq 0 ]; then
    printf 'Mode (work/personal/all): '
    if ! IFS= read -r mode; then
        echo "No mode selected. Pass work, personal, or all." >&2
        exit 1
    fi
fi

case "$mode" in
    work) sessions="$shared_sessions $work_sessions" ;;
    personal) sessions="$shared_sessions $personal_sessions" ;;
    all) sessions="$shared_sessions $work_sessions $personal_sessions" ;;
    -h|--help) usage; exit 0 ;;
    *)
        echo "Unknown mode: $mode" >&2
        usage >&2
        exit 1
        ;;
esac

for command in tmuxp tmux; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Required command not found: $command" >&2
        exit 1
    fi
done

echo "Starting $mode tmux sessions"

# Split the configured lists on whitespace, but never expand filename patterns.
set -f
for session in $sessions; do
    tmuxp load -d "$session"
done

tmux ls
