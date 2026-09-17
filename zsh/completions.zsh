#!/bin/zsh
#
# completions.zsh — shell completions for external CLIs.
# Requires bashcompinit/compinit (initialized in .zshrc before this is sourced).

# AWS CLI
if command -v aws_completer >/dev/null; then
  complete -C "$(command -v aws_completer)" aws
  complete -C "$(command -v aws_completer)" awslocal
fi

# kubectl (cached; regenerated only when the kubectl binary changes)
if command -v kubectl >/dev/null; then
  _kube_cache="${ZDOTDIR:-$HOME}/.cache/kubectl.zsh"
  if [[ ! -r "$_kube_cache" || "$commands[kubectl]" -nt "$_kube_cache" ]]; then
    mkdir -p "${_kube_cache:h}"
    kubectl completion zsh > "$_kube_cache"
  fi
  source "$_kube_cache"
  unset _kube_cache
fi
