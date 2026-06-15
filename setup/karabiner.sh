##############
# setup karabiner-elements #
##############
# macOS keyboard remapping. Symlinks repo config so GUI edits write back to the repo.
# macOS only — skip silently on Linux/WSL.

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Skipping karabiner (macOS only)"
  exit 0
fi

# Install karabiner-elements
if $(command -v karabiner_cli >/dev/null 2>&1); then
  echo "****************************"
  echo "* karabiner-elements installed *"
  echo "****************************"
else
  echo "*****************************"
  echo "* installing karabiner-elements *"
  echo "*****************************"

  if $(command -v brew >/dev/null 2>&1); then
    brew install --cask karabiner-elements 2>/dev/null || true
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi
fi

# Symlink config — Karabiner writes back through the symlink, so GUI edits
# stay tracked in the repo.
KARABINER_DIR="$HOME/.config/karabiner"
REPO_CONFIG="$HOME/.scripts/karabiner.json"
LIVE_CONFIG="$KARABINER_DIR/karabiner.json"

mkdir -p "$KARABINER_DIR"

if [[ -L "$LIVE_CONFIG" ]]; then
  echo "karabiner.json already symlinked."
elif [[ -f "$LIVE_CONFIG" ]]; then
  echo "Backing up existing karabiner.json to karabiner.json.bak"
  mv "$LIVE_CONFIG" "${LIVE_CONFIG}.bak"
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
  echo "karabiner.json symlinked to repo."
else
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
  echo "karabiner.json symlinked to repo."
fi
