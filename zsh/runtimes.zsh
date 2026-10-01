#!/bin/zsh
#
# runtimes.zsh — mise is the only language/runtime version manager.
#
# Enable mise's idiomatic version files so existing repositories continue to
# work without converting .java-version and .python-version to mise.toml.
export MISE_IDIOMATIC_VERSION_FILE_ENABLE_TOOLS="${MISE_IDIOMATIC_VERSION_FILE_ENABLE_TOOLS:-java,python}"

if [[ -x "$HOME/.local/bin/mise" ]]; then
  mise_bin="$HOME/.local/bin/mise"
elif command -v mise >/dev/null 2>&1; then
  mise_bin="$(command -v mise)"
else
  mise_bin=""
fi

[[ -n "$mise_bin" ]] && eval "$("$mise_bin" activate zsh)"
unset mise_bin
