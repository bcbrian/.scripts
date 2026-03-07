##############
# update .scripts #
##############
# Pull latest and re-run setup scripts to apply changes.
# Use when you already have the repo and want to "finish the init" or sync updates.

source ~/.zshrc 2>/dev/null || true

SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/.scripts}"

if [[ ! -d "$SCRIPTS_DIR" ]] || [[ ! -d "$SCRIPTS_DIR/.git" ]]
then
  echo "~/.scripts not found or not a git repo. Run full setup first."
  exit 1
fi

echo "**************************"
echo "* updating .scripts      *"
echo "**************************"

# Run all setup scripts (same as initial setup - single source of truth)
bash "$SCRIPTS_DIR/setup/run-setup-scripts.sh"

# Sync LazyVim plugins (installs any new plugins from updated lazy.lua)
if [[ -f "$SCRIPTS_DIR/lazyvim/lua/config/lazy.lua" ]] && $(command -v nvim >/dev/null 2>&1); then
  echo "Syncing LazyVim plugins..."
  nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
fi

echo "Update complete."
