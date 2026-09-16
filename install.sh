#!/usr/bin/env bash
#
# qiubix-settings installer — takes a clean Mac to a working setup.
# Idempotent: safe to re-run. Real files are backed up before being replaced;
# existing symlinks are force-relinked.
#
#   git clone https://github.com/qiubix/qiubix-settings.git ~/qiubix-settings
#   cd ~/qiubix-settings && ./install.sh

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

# ── 0. Platform guard ────────────────────────────────────────────
# macOS only for now. Add a Linux branch here when needed.
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This installer currently supports macOS only." >&2
  exit 1
fi

# ── 1. Homebrew ──────────────────────────────────────────────────
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Make brew available on this shell (Apple Silicon default prefix).
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

log "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

# ── 2. Seed machine-local files (never overwrite existing) ────────
# Git identity: harvest from any pre-existing real ~/.gitconfig so the live
# identity is preserved; otherwise fall back to the template.
if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  log "Seeding ~/.gitconfig.local"
  if [[ -f "$HOME/.gitconfig" && ! -L "$HOME/.gitconfig" ]]; then
    name="$(git config -f "$HOME/.gitconfig" user.name || true)"
    email="$(git config -f "$HOME/.gitconfig" user.email || true)"
    {
      printf '[user]\n'
      [[ -n "$name" ]]  && printf '\tname = %s\n' "$name"
      [[ -n "$email" ]] && printf '\temail = %s\n' "$email"
      # Preserve any existing safe.directory entries.
      while IFS= read -r dir; do
        [[ -n "$dir" ]] && printf '[safe]\n\tdirectory = %s\n' "$dir"
      done < <(git config -f "$HOME/.gitconfig" --get-all safe.directory 2>/dev/null || true)
    } > "$HOME/.gitconfig.local"
  else
    cp "$DOTFILES/templates/gitconfig.local.example" "$HOME/.gitconfig.local"
    echo "  -> filled from template; edit ~/.gitconfig.local with your identity."
  fi
fi

# Zsh secrets (lives in the repo dir = ZDOTDIR; gitignored).
if [[ ! -f "$DOTFILES/zsh/secrets.zsh" ]]; then
  log "Seeding zsh/secrets.zsh"
  cp "$DOTFILES/zsh/secrets.zsh.example" "$DOTFILES/zsh/secrets.zsh"
fi

# ── 3. Symlink manifest (single source of truth) ─────────────────
link() {  # link <repo-relative-src> <absolute-dest>
  local src="$DOTFILES/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -L "$dest" ]]; then
    ln -sfn "$src" "$dest"
  elif [[ -e "$dest" ]]; then
    mkdir -p "$backup_dir"
    mv "$dest" "$backup_dir/"
    ln -s "$src" "$dest"
    echo "  backed up existing $dest -> $backup_dir/"
  else
    ln -s "$src" "$dest"
  fi
}

log "Linking dotfiles..."
link zsh/.zshenv            "$HOME/.zshenv"
link zsh                    "$HOME/.config/zsh"
link vim/vimrc-server.vim   "$HOME/.vimrc"
link vim/idea.vim           "$HOME/.ideavimrc"
link vim/nvim               "$HOME/.config/nvim"
link .inputrc               "$HOME/.inputrc"
link .gitconfig             "$HOME/.gitconfig"
link .gitignore_global      "$HOME/.gitignore_global"
link ghostty/config         "$HOME/.config/ghostty/config"
link tmux/tmux.conf         "$HOME/.config/tmux/tmux.conf"
link tmux/tmuxp-configs     "$HOME/.config/tmuxp"
link tmux/start-tmux.sh     "$HOME/.local/bin/start-tmux"

# ── 4. Default shell ─────────────────────────────────────────────
zsh_path="$(command -v zsh)"
if [[ "${SHELL:-}" != "$zsh_path" ]]; then
  log "Setting zsh as the default shell..."
  grep -qxF "$zsh_path" /etc/shells || echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
  chsh -s "$zsh_path" || echo "  (could not chsh automatically; run: chsh -s $zsh_path)"
fi

log "Done. Start a new shell for full effect."
[[ -d "$backup_dir" ]] && echo "Replaced files were backed up to: $backup_dir"
