#!/bin/zsh
#
# completions.zsh — shell completions for external CLIs.
# Requires bashcompinit/compinit (initialized in .zshrc before this is sourced).

# AWS CLI
if command -v aws_completer >/dev/null; then
  complete -C "$(command -v aws_completer)" aws
  complete -C "$(command -v aws_completer)" awslocal
fi

# kubectl
command -v kubectl >/dev/null && source <(kubectl completion zsh)
