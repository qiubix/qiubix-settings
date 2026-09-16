# qiubix-settings

My personal macOS dotfiles: shell, editor, terminal and tooling configuration.

## Layout

| Path              | What it is |
|-------------------|------------|
| `zsh/`            | Zsh config (antidote-managed plugins, aliases, env). `.zshrc`, `.zshenv`, custom plugins, functions. |
| `vim/`            | Neovim is primary: `vim/nvim/` (Lua config). `vimrc-server.vim` is a minimal no-plugin fallback for plain `vim`. `idea.vim` for IdeaVim. `vim/legacy/` holds the old classic Vundle config, kept for reference but not deployed. |
| `tmux/`           | `tmux.conf`, `tmuxp-configs/` session layouts, `start-tmux.sh`. |
| `ghostty/`        | Ghostty terminal config. |
| `scripts/`        | `gitsetup_qiubix.sh` / `gitsetup_touk.sh` — git identity + SSH key setup (personal / work). |
| `bootstrap-mac.sh`| Homebrew package/app install list. |
| `.gitconfig`, `.gitignore_global`, `.inputrc` | Misc dotfiles symlinked into `~`. |

Per-tool `bootstrap.sh` scripts under `zsh/`, `vim/`, `tmux/` symlink each tool's
config into place.

## Status

This repo is mid-cleanup. There is **no unified installer yet** — deployment is
still per-tool `bootstrap.sh` scripts plus `bootstrap-mac.sh`. A single install
entry point (stow / chezmoi / one script) is TBD.

Version managers (mise, and legacy jenv/pyenv) currently coexist in `zsh/env.zsh`;
consolidation onto `mise` is in progress.
