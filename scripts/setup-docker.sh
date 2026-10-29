#!/usr/bin/env bash
#
# Docker via Colima — the same setup on every machine (Apple Silicon macOS).
# Installs the Docker CLI tooling, configures ~/.docker/config.json, and
# (re)starts the Colima profile with the settings below. Safe to re-run: a
# running profile is stopped first so changed settings take effect.
#
# Override any value for a one-off setup, for example:
#   COLIMA_CPU=8 COLIMA_MEMORY=12 COLIMA_DISK=100 scripts/setup-docker.sh
#
# Registry logins are machine-specific and not handled here; run
# `docker login <registry>` afterwards (credentials go to the macOS keychain).

set -Eeuo pipefail

COLIMA_PROFILE="${COLIMA_PROFILE:-default}"
COLIMA_CPU="${COLIMA_CPU:-6}"
COLIMA_MEMORY="${COLIMA_MEMORY:-8}"
COLIMA_DISK="${COLIMA_DISK:-60}"
if [[ "$COLIMA_PROFILE" == "default" ]]; then
  COLIMA_HOSTNAME="${COLIMA_HOSTNAME:-colima}"
  expected_context="colima"
else
  COLIMA_HOSTNAME="${COLIMA_HOSTNAME:-colima-$COLIMA_PROFILE}"
  expected_context="colima-$COLIMA_PROFILE"
fi

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
fail() { printf 'Error: %s\n' "$*" >&2; exit 1; }

[[ "$(uname -s)" == "Darwin" ]] || fail "this setup requires macOS"
[[ "$(uname -m)" == "arm64" ]] || fail "this setup requires Apple Silicon (arm64)"
command -v brew >/dev/null 2>&1 || fail "Homebrew is required; run ./install.sh first"

# DOCKER_HOST overrides the active Docker context; ignore it while verifying.
docker_host="${DOCKER_HOST:-}"
unset DOCKER_HOST

# ── 1. Packages (also in the Brewfile; installed here for standalone runs) ──
formulae=(colima docker docker-compose docker-buildx docker-credential-helper jq)
missing=()
for formula in "${formulae[@]}"; do
  brew list --formula "$formula" >/dev/null 2>&1 || missing+=("$formula")
done
if ((${#missing[@]})); then
  log "Installing ${missing[*]}..."
  brew install "${missing[@]}"
fi

# ── 2. Docker CLI config ─────────────────────────────────────────
# Merged rather than replaced: docker login records registries in this file.
log "Configuring ~/.docker/config.json"
docker_config="${DOCKER_CONFIG:-$HOME/.docker}/config.json"
mkdir -p "$(dirname "$docker_config")"
[[ -s "$docker_config" ]] || echo '{}' > "$docker_config"
tmp="$(mktemp)"
jq --arg plugins "$(brew --prefix)/lib/docker/cli-plugins" \
   --arg context "$expected_context" '
  .credsStore = "osxkeychain"
  | .currentContext = $context
  | .cliPluginsExtraDirs = ((.cliPluginsExtraDirs // []) - [$plugins] + [$plugins])
' "$docker_config" > "$tmp"
mv "$tmp" "$docker_config"
chmod 600 "$docker_config"

# ── 3. Colima profile ────────────────────────────────────────────
log "Applying Colima profile: $COLIMA_PROFILE"
# Stopping first makes changed resource settings take effect.
if colima status "$COLIMA_PROFILE" >/dev/null 2>&1; then
  colima stop "$COLIMA_PROFILE"
fi

colima start "$COLIMA_PROFILE" \
  --cpus "$COLIMA_CPU" \
  --memory "$COLIMA_MEMORY" \
  --disk "$COLIMA_DISK" \
  --arch aarch64 \
  --runtime docker \
  --hostname "$COLIMA_HOSTNAME" \
  --vm-type vz \
  --vz-rosetta=true \
  --mount-type virtiofs \
  --mount-inotify=false \
  --kubernetes=false \
  --network-address=false \
  --network-host-addresses=false \
  --network-mode shared \
  --port-forwarder ssh \
  --binfmt=true \
  --ssh-agent=false \
  --ssh-config=true \
  --activate=true \
  --save-config=true

# ── 4. Verify ────────────────────────────────────────────────────
log "Verifying Docker"
active_context="$(docker context show)"
[[ "$active_context" == "$expected_context" ]] ||
  fail "Docker context $active_context is active; expected $expected_context"
docker version --format 'Docker client {{.Client.Version}}, server {{.Server.Version}}'
docker compose version
docker buildx version

log "Docker is ready using Colima profile $COLIMA_PROFILE."
if [[ -n "$docker_host" ]]; then
  echo "  Note: DOCKER_HOST=$docker_host in your shell overrides the Docker context."
fi
