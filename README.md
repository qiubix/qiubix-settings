# qiubix-settings

My personal macOS dotfiles: shell, editor, terminal and tooling configuration.

## Layout

| Path              | What it is |
|-------------------|------------|
| `zsh/`            | Zsh config (antidote-managed plugins, aliases, env). `.zshrc`, `.zshenv`, custom plugins, functions. |
| `vim/`            | Neovim is primary: `vim/nvim/` (Lua config). `vimrc-server.vim` is a minimal no-plugin fallback for plain `vim`. `idea.vim` for IdeaVim. `vim/legacy/` holds the old classic Vundle config, kept for reference but not deployed. |
| `tmux/`           | `tmux.conf`, `tmuxp-configs/` session layouts, `start-tmux.sh`. |
| `ghostty/`        | Ghostty terminal config. |
| `scripts/`        | `setup-git.sh` — per-directory identities and personal SSH host aliases. |
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

**Git setup:** after installing, run:

```sh
~/qiubix-settings/scripts/setup-git.sh
```

The script asks which identity should be the default and asks for both a work
and personal repository root. Repositories below those roots automatically use
their matching identity through Git's `includeIf gitdir` support; the selected
default applies outside both roots. Git, Neovim, and IDEs therefore see the
same identity without shell switching. The script creates separate personal
and work SSH keys with stable aliases:

```sh
git@github.com-personal:OWNER/REPO.git
git@gitlab.com-personal:NAMESPACE/REPO.git
git@github.com-work:ORG/REPO.git
git@gitlab.com-work:NAMESPACE/REPO.git
```

Work repositories can use HTTPS or the work SSH aliases. For GitHub-hosted
work over HTTPS, run `gh auth login` followed by `gh auth setup-git` once;
IDEs reuse Git's credential helper. Existing clones should have their remotes
changed to the appropriate alias, for example:

```sh
git remote set-url origin git@github.com-personal:OWNER/REPO.git
```

**Runtime versions:** `zsh/runtimes.zsh` uses mise exclusively. It enables
idiomatic `.java-version` and `.python-version` files, so existing repositories
continue to select their declared versions without migration. From a repository
directory, run `mise install` to install the declared versions and
`mise ls --current` to inspect what mise selected.
