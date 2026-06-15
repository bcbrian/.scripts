##############
# setup ghostty #
##############
# GPU-accelerated terminal emulator. macOS only — no Linux cask.
# Config directory is symlinked from repo so edits are tracked in git.

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Skipping ghostty (macOS only)"
  exit 0
fi

if $(command -v ghostty >/dev/null 2>&1); then
  echo "*********************"
  echo "* ghostty installed *"
  echo "*********************"
else
  echo "**********************"
  echo "* installing ghostty *"
  echo "**********************"

  if $(command -v brew >/dev/null 2>&1); then
    brew install --cask ghostty 2>/dev/null || true
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi
fi

# Symlink config directory so all edits are tracked in the repo.
LIVE_CONFIG="$HOME/.config/ghostty"
REPO_CONFIG="$HOME/.scripts/ghostty"

if [[ -L "$LIVE_CONFIG" ]]; then
  echo "ghostty config already symlinked."
elif [[ -d "$LIVE_CONFIG" ]]; then
  echo "Backing up existing ~/.config/ghostty to ~/.config/ghostty.bak"
  rm -rf "${LIVE_CONFIG}.bak"
  mv "$LIVE_CONFIG" "${LIVE_CONFIG}.bak"
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
  echo "ghostty config symlinked to repo."
else
  mkdir -p "$HOME/.config"
  ln -sf "$REPO_CONFIG" "$LIVE_CONFIG"
  echo "ghostty config symlinked to repo."
fi
