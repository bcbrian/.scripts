##############
# setup lazygit #
##############
# LazyVim requirement. Idempotent: skips if already installed.

if $(command -v lazygit >/dev/null 2>&1); then
  echo "*********************"
  echo "* lazygit installed *"
  echo "*********************"
  exit 0
fi

echo "**********************"
echo "* installing lazygit  *"
echo "**********************"

if $(command -v brew >/dev/null 2>&1); then
  brew install lazygit 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  echo "  Manual: https://github.com/jesseduffield/lazygit#installation"
  # --- apt fallback (commented while standardizing on brew; no standard apt package) ---
  # sudo apt-get update -qq 2>/dev/null || true
  # sudo apt-get install -y lazygit 2>/dev/null || true
  exit 0
fi

if $(command -v lazygit >/dev/null 2>&1); then
  echo "lazygit installed successfully."
else
  echo "Install may have failed. See: https://github.com/jesseduffield/lazygit#installation"
fi
