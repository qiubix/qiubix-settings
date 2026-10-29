# qiubix-settings

My personal macOS dotfiles: shell, editor, terminal and tooling configuration.

## Layout

| Path              | What it is |
|-------------------|------------|
| `zsh/`            | Zsh config (antidote-managed plugins, aliases, env). `.zshrc`, `.zshenv`, custom plugins, functions. |
| `vim/`            | Neovim is primary: `vim/nvim/` (Lua config). `vimrc-server.vim` is a minimal no-plugin fallback for plain `vim`. `idea.vim` for IdeaVim. `vim/legacy/` holds the old classic Vundle config, kept for reference but not deployed. |
| `tmux/`           | `tmux.conf`, `tmuxp-configs/` session layouts, `start-tmux.sh`. |
| `ghostty/`        | Ghostty terminal config. |
| `scripts/`        | `setup-git.sh` — Git identities and SSH host aliases for a personal or work machine. `setup-docker.sh` — Docker via Colima. |
| `install.sh`      | The single entry point (see below). |
| `Brewfile`        | Homebrew packages/casks, installed via `brew bundle`. |
| `templates/`      | Seeds for machine-local files (`~/.gitconfig.local`). |
| `.gitconfig`, `.gitignore_global`, `.inputrc` | Dotfiles symlinked into `~`. |

## Install

```sh
git clone https://github.com/qiubix/qiubix-settings.git ~/qiubix-settings
cd ~/qiubix-settings && ./install.sh --personal   # or --work
```

`install.sh` is idempotent (safe to re-run). It installs Homebrew if missing,
runs `brew bundle --no-upgrade` (installs missing packages only; a failed
package is reported but does not stop the install), seeds machine-local files, and symlinks configs into place.
A single manifest inside `install.sh` is the source of truth for every symlink.

**Safety:** any pre-existing *real* file at a target path is moved to
`~/.dotfiles-backup/<timestamp>/` before its symlink is created; existing symlinks
are force-relinked.

**Git setup:** `install.sh --personal` / `--work` runs `scripts/setup-git.sh`
with that flag at the end. Without a flag that step is skipped; run it any
time later (re-running is safe, and switching machine type cleanly replaces
the previous setup):

```sh
~/qiubix-settings/scripts/setup-git.sh --personal   # or --work
```

The machine type is remembered in `~/.gitconfig.local` (`qiubix.machine`) and
offered as the default when the script is run without a flag.

*Personal machine:* a single identity in `~/.gitconfig.local`, and personal
GitHub/GitLab SSH keys bound directly to `github.com` and `gitlab.com`, so
plain remotes work (the `-personal` aliases below are accepted too):

```sh
git@github.com:OWNER/REPO.git
git@gitlab.com:NAMESPACE/REPO.git
```

*Work machine:* the script asks which identity should be the default and asks
for both a work and personal repository root. Repositories below those roots
automatically use their matching identity through Git's `includeIf gitdir`
support; the selected default applies outside both roots. Git, Neovim, and IDEs
therefore see the same identity without shell switching. The script creates
separate personal and work SSH keys with stable aliases:

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

**Docker:** Docker runs in a Colima VM (Apple Silicon only). On the first
run `install.sh` calls `scripts/setup-docker.sh`, which starts the default
profile with 6 CPUs, 8 GiB memory, a 60 GiB disk, the `vz` VM type, VirtioFS
mounts and Rosetta, and activates the `colima` Docker context. It also merges
`credsStore: osxkeychain` and Homebrew's CLI-plugin directory (Compose, Buildx)
into `~/.docker/config.json`, keeping existing registry entries. Re-run the
script to re-apply settings (it restarts the VM); override resources per
machine:

```sh
COLIMA_CPU=8 COLIMA_MEMORY=12 COLIMA_DISK=100 scripts/setup-docker.sh
```

Registry logins are per machine: `docker login <registry>`.

**Runtime versions:** `zsh/runtimes.zsh` uses mise exclusively. It enables
idiomatic `.java-version` and `.python-version` files, so existing repositories
continue to select their declared versions without migration. From a repository
directory, run `mise install` to install the declared versions and
`mise ls --current` to inspect what mise selected.
