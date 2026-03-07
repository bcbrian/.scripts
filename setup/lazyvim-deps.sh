##############
# LazyVim deps: fd, ripgrep, fzf #
##############
# For fzf-lua (find files, live grep). Idempotent: skips if already installed.

install_with_brew() {
  local pkg="$1"
  if ! $(command -v "$pkg" >/dev/null 2>&1); then
    echo "Installing $pkg via Homebrew..."
    brew install "$pkg" 2>/dev/null || true
  else
    echo "* $pkg installed *"
  fi
}

install_with_apt() {
  local pkg="$1"
  shift
  local bins=("$@")
  local found=0
  for b in "${bins[@]}"; do
    $(command -v "$b" >/dev/null 2>&1) && found=1 && break
  done
  if [[ $found -eq 0 ]]; then
    echo "Installing $pkg via apt..."
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y "$pkg" 2>/dev/null || true
  else
    echo "* $bin installed *"
  fi
}

echo "***************************"
echo "* LazyVim deps (fd, rg, fzf) *"
echo "***************************"

if $(command -v brew >/dev/null 2>&1); then
  install_with_brew fd
  install_with_brew ripgrep
  install_with_brew fzf
elif $(command -v apt-get >/dev/null 2>&1); then
  install_with_apt fd-find fdfind
  install_with_apt ripgrep
  install_with_apt fzf
else
  echo "No brew or apt found. Install manually:"
  echo "  - fd:     https://github.com/sharkdp/fd"
  echo "  - ripgrep: https://github.com/BurntSushi/ripgrep"
  echo "  - fzf:    https://github.com/junegunn/fzf (v0.25.1+)"
fi
