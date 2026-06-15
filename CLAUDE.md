# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

`~/.scripts` is a cross-platform (macOS + Linux/WSL) dev environment bootstrapper. A single `curl | bash` against `setup.sh` clones the repo and installs everything. The same scripts run idempotently on update.

**Entry points:**
- `setup.sh` — full bootstrap (curl phase → clone → run all scripts)
- `setup/update.sh` — pull latest + re-run all scripts (also available as the `update` shell alias)

**Run update from anywhere:**
```bash
update
# or directly:
bash ~/.scripts/setup/update.sh
```

## Architecture

### Single source of truth: `setup/scripts-order.sh`

The `SETUP_SCRIPTS` array in this file controls execution order for both initial setup and updates. Both `setup.sh` and `update.sh` delegate to `setup/run-setup-scripts.sh`, which sources this file and loops over the array.

Current order:
```
brew → git → zsh → ohmyzsh → nvm → bun → java
→ nvim → lazyvim-deps → lazygit → tree-sitter-deps → lazyvim
→ gh → gh-auth → cursor → cursor-agent → claude-code
```

### Each script in `setup/`

Every tool gets its own script. The canonical pattern:

1. `command -v <binary>` guard at the top — if installed, print banner and exit (idempotent)
2. Install via `brew install <formula>` (preferred) or the tool's official curl installer (nvm, bun, claude-code, cursor-agent)
3. Post-install `command -v` check to confirm success

Commented-out `apt` fallback blocks are kept but inactive — Homebrew is the single package manager on both macOS and Linux/WSL.

### brew PATH propagation (load-bearing detail)

Each script runs as a **separate process**, so `eval "$(brew shellenv)"` inside `brew.sh` doesn't carry over. Two places re-export brew:

- `zsh/.myzshrc` — checks all three brew install locations and evals shellenv; sourced at the top of scripts that need it
- `setup/run-setup-scripts.sh` — re-evals brew shellenv immediately after `brew.sh` completes, so later scripts in the loop find brew

If you add a new script that uses brew, ensure it either sources `~/.zshrc` or comes after the brew PATH re-eval in `run-setup-scripts.sh`.

### `zsh/.myzshrc`

Sourced by `~/.zshrc`. Handles:
- Homebrew PATH (all three install locations)
- NVM with auto-version-switching on `precmd` (reads `.nvmrc`, switches or reverts to default)
- Bun PATH
- `~/.local/bin` on PATH (used by claude-code and cursor-agent)
- Shell aliases: `update`, `reset`, `scripts`, `config`, `vimrc`, `vim`/`vi` → nvim

### Auto-update

`.myzshrc` pulls the repo in the background once per 24 hours using a `.last-auto-pull` timestamp file (gitignored).

## Adding a new package or config

Use the `/add-package` skill — it encodes the full pattern (script template, idempotency guard, placement rules, PATH notes, config symlink pattern, macOS-only guards).

Quick summary of what to touch:
1. Create `setup/<name>.sh` using the idempotent brew or curl-installer template
2. Add `"<name>.sh"` to the `SETUP_SCRIPTS` array in `setup/scripts-order.sh` at the correct position (dependencies before dependents; GUI/AI agents at the end)
3. If the tool installs to a non-standard path (e.g. `~/.cargo/bin`), add it to `zsh/.myzshrc`

## Key constraints

- **No Brewfile.** Packages are declared inline in their individual `setup/*.sh` scripts.
- **Idempotent always.** Every script must be safe to re-run without side effects.
- **Brew over apt.** Even on Linux. Apt fallback blocks are commented, not active.
- **`clone-scripts.sh` is not in the array** — it runs in `setup.sh`'s curl phase before the repo exists.
- `ohmyzsh.sh`, `nvm.sh`, and `bun.sh` run with `zsh` (not `bash`) because their installers or init hooks require it; all other scripts use `bash`.
- Interactive prompts (git config, `gh auth login`) read from `/dev/tty` so they work even when the script is piped via `curl | bash`.
