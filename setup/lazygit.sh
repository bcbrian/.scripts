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
elif $(command -v apt-get >/dev/null 2>&1); then
  sudo apt-get update -qq 2>/dev/null || true
  sudo apt-get install -y lazygit 2>/dev/null || true
else
  echo "No brew or apt found. Install manually:"
  echo "  https://github.com/jesseduffield/lazygit#installation"
  exit 0
fi

if $(command -v lazygit >/dev/null 2>&1); then
  echo "lazygit installed successfully."
else
  echo "Install may have failed. See: https://github.com/jesseduffield/lazygit#installation"
fi
