# qiubix-settings

My personal macOS dotfiles: shell, editor, terminal and tooling configuration.

## Layout

| Path              | What it is |
|-------------------|------------|
| `zsh/`            | Zsh config (antidote-managed plugins, aliases, env). `.zshrc`, `.zshenv`, custom plugins, functions. |
| `vim/`            | Neovim is primary: `vim/nvim/` (Lua config). `vimrc-server.vim` is a minimal no-plugin fallback for plain `vim`. `idea.vim` for IdeaVim. `vim/legacy/` holds the old classic Vundle config, kept for reference but not deployed. |
| `tmux/`           | `tmux.conf`, `tmuxp-configs/` session layouts, `start-tmux.sh`. |
| `ghostty/`        | Ghostty terminal config. |
| `scripts/`        | `gitsetup_*.sh` — SSH key / git identity helpers. |
| `install.sh`      | The single entry point (see below). |
| `Brewfile`        | Homebrew packages/casks, installed via `brew bundle`. |
| `templates/`      | Seeds for machine-local files (`~/.gitconfig.local`). |
| `.gitconfig`, `.gitignore_global`, `.inputrc` | Dotfiles symlinked into `~`. |

## Install

```sh
git clone https://github.com/qiubix/qiubix-settings.git ~/qiubix-settings
cd ~/qiubix-settings && ./install.sh
```

`install.sh` is idempotent (safe to re-run). It installs Homebrew if missing,
runs `brew bundle`, seeds machine-local files, and symlinks configs into place.
A single manifest inside `install.sh` is the source of truth for every symlink.

**Safety:** any pre-existing *real* file at a target path is moved to
`~/.dotfiles-backup/<timestamp>/` before its symlink is created; existing symlinks
are force-relinked.

**Git identity:** the tracked `.gitconfig` holds only shared settings and
`[include]`s `~/.gitconfig.local`, which is untracked and holds your identity +
host-specific settings. On first run `install.sh` seeds `~/.gitconfig.local`,
harvesting identity from any existing `~/.gitconfig` so nothing is lost.

Version managers (mise, and legacy jenv/pyenv) currently coexist in `zsh/env.zsh`;
consolidation onto `mise` is in progress.
