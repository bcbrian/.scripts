# LazyVim requires Neovim >= 0.11.2
NVIM_REQUIRED="0.11.2"

nvim_version() {
  command nvim --version 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "0"
}

nvim_meets_requirement() {
  local current
  current=$(nvim_version)
  [[ "$(printf '%s\n' "$NVIM_REQUIRED" "$current" | sort -V | tail -1)" == "$current" ]]
}

do_install_nvim() {
  if command -v brew >/dev/null 2>&1; then
    brew install neovim
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi
  # --- apt fallback (commented while standardizing on brew) ---
  # Note: Ubuntu's apt neovim is usually < 0.11.2 and breaks LazyVim.
  # elif $(command -v apt-get >/dev/null 2>&1); then
  #   sudo apt-get update -qq 2>/dev/null || true
  #   sudo apt-get install -y neovim 2>/dev/null || true
}

do_upgrade_nvim() {
  if command -v brew >/dev/null 2>&1; then
    brew update -q
    brew upgrade neovim || brew install neovim
  fi
  # --- apt fallback (commented while standardizing on brew) ---
  # elif $(command -v apt-get >/dev/null 2>&1); then
  #   sudo apt-get update -qq
  #   sudo apt-get install -y --only-upgrade neovim
}

if ! $(command -v nvim >/dev/null 2>&1); then
  echo "*******************"
  echo "* installing nvim *"
  echo "*******************"
  do_install_nvim
elif ! nvim_meets_requirement; then
  echo "***************************"
  echo "* upgrading nvim (need >= $NVIM_REQUIRED for LazyVim) *"
  echo "***************************"
  echo "  current: $(nvim_version)"
  do_upgrade_nvim
else
  echo "******************"
  echo "* nvim installed *"
  echo "******************"
fi