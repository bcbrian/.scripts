# add-package skill

Add a new tool/package to this scripts repo so it installs automatically on any machine running `setup.sh` or `update.sh`.

## What you'll do

1. **Identify the package** — use the args if provided, otherwise ask: name, install method (brew or curl installer), binary name used to check if it's installed, and where in the setup order it belongs.

2. **Create `setup/<name>.sh`** — follow the established pattern exactly (see below).

3. **Wire into `setup/scripts-order.sh`** — add the filename at the correct position in the `SETUP_SCRIPTS` array.

4. **Check `.myzshrc` PATH** — if the tool installs to a non-standard location (e.g. `~/.local/bin`, `~/.cargo/bin`), verify `zsh/.myzshrc` already exports that path; add it if missing.

5. **Report** — list every file changed and the exact line(s) modified.

## Script pattern

### Brew-installed tool

```bash
##############
# setup <name> #
##############
# One-line description of what this tool is / why it's here.

if $(command -v <binary> >/dev/null 2>&1); then
  echo "*********************"
  echo "* <name> installed  *"
  echo "*********************"
  exit 0
fi

echo "**********************"
echo "* installing <name>  *"
echo "**********************"

if $(command -v brew >/dev/null 2>&1); then
  brew install <brew-formula> 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  echo "  Manual: <upstream install URL>"
  # --- apt fallback (commented while standardizing on brew) ---
  # sudo apt-get update -qq 2>/dev/null || true
  # sudo apt-get install -y <apt-name> 2>/dev/null || true
  exit 0
fi

if $(command -v <binary> >/dev/null 2>&1); then
  echo "<name> installed successfully."
else
  echo "Install may have failed. See: <upstream URL>"
fi
```

### Curl-installer tool (e.g. nvm, bun, claude-code)

```bash
##############
# setup <name> #
##############
# One-line description. Installs to <location> (on PATH via .myzshrc).

source ~/.zshrc 2>/dev/null || true

if command -v <binary> >/dev/null 2>&1; then
  echo "*********************"
  echo "* <name> installed  *"
  echo "*********************"
else
  echo "**********************"
  echo "* installing <name>  *"
  echo "**********************"
  curl -fsSL <installer-url> | bash
  # Installs to <location> — ensure it's on PATH for the rest of this session.
  [[ -d "$HOME/<install-dir>" ]] && export PATH="$HOME/<install-dir>:$PATH"
fi
```

## Config file management

Some tools store their config at a well-known path (e.g. `~/.config/<tool>/config.json`). When the repo ships a config file for that tool, symlink rather than copy — the symlink keeps the live config and the repo file in sync, and GUI changes write back through the symlink into git.

### Symlink pattern (used by karabiner, lazyvim)

```bash
CONFIG_DIR="$HOME/.config/<tool>"
REPO_CONFIG="$HOME/.scripts/<tool-config-file>"
LIVE_CONFIG="$CONFIG_DIR/<config-file>"

mkdir -p "$CONFIG_DIR"

if [[ -L "$LIVE_CONFIG" ]]; then
  echo "<tool> config already symlinked."
elif [[ -f "$LIVE_CONFIG" ]]; then
  echo "Backing up existing config to <config-file>.bak"
  mv "$LIVE_CONFIG" "${LIVE_CONFIG}.bak"
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
else
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
fi
```

LazyVim symlinks the whole directory: `ln -sf ~/.scripts/lazyvim ~/.config/nvim`
Karabiner symlinks just the JSON file: `ln -sf ~/.scripts/karabiner.json ~/.config/karabiner/karabiner.json`

Use the whole-directory approach when the tool's config is entirely repo-managed. Use the single-file approach when the tool manages other files in that directory (backups, assets, etc.).

### macOS-only tools

Add an OS guard at the top of the script:

```bash
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Skipping <name> (macOS only)"
  exit 0
fi
```

## Placement rules for scripts-order.sh

- **Core shell/env tools** go near the top (after `brew.sh`, `git.sh`, `zsh.sh`)
- **Language runtimes** (node/java/go/rust) go in the middle cluster
- **Editor tooling** (nvim plugins, formatters, LSPs) go after `nvim.sh`
- **GUI apps / AI agents / auth steps / macOS-only tools** go at the end
- **Dependencies go before dependents** — if tool B needs tool A, B must come after A

Current order for reference:
```
brew.sh → git.sh → zsh.sh → ohmyzsh.sh → nvm.sh → bun.sh → java.sh
→ nvim.sh → lazyvim-deps.sh → lazygit.sh → tree-sitter-deps.sh → lazyvim.sh
→ gh.sh → gh-auth.sh → cursor.sh → cursor-agent.sh → claude-code.sh → karabiner.sh
```

## Key constraints

- Every script must be **idempotent** — safe to re-run; always check `command -v <binary>` before installing
- **Brew is the standard package manager** — use curl installers only when the tool's official distribution method is a script (like nvm, bun) or the tool itself is its own binary release
- Do **not** create a Brewfile — packages are declared inline in their own script
- The binary name in `command -v` must be the actual binary, not the brew formula name (they can differ, e.g. `openjdk` → `javac`)
