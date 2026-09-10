##############
# setup anyzig #
##############
# anyzig: a `zig` shim that downloads/uses the zig version pinned by each
# project's build.zig.zon (or a default). https://github.com/marler8997/anyzig
# Idempotent: upgrades if brew-installed, otherwise skips when present.

source ~/.zshrc 2>/dev/null || true

if command -v zig >/dev/null 2>&1; then
  echo "********************"
  echo "* anyzig installed *"
  echo "********************"
  # ponytail: update flow is just brew upgrade; tarball installs re-run the curl below manually
  brew list anyzig >/dev/null 2>&1 && brew upgrade anyzig 2>/dev/null || true
  exit 0
fi

echo "*********************"
echo "* installing anyzig *"
echo "*********************"

if command -v brew >/dev/null 2>&1; then
  brew tap anyzig/tap 2>/dev/null || true
  brew install anyzig 2>/dev/null || true
else
  # No brew (e.g. minimal Linux): official release tarball into ~/.local/bin (on PATH via .myzshrc).
  os=$([[ "$(uname -s)" == "Darwin" ]] && echo macos || echo linux)
  arch=$([[ "$(uname -m)" == "arm64" ]] && echo aarch64 || uname -m)
  mkdir -p "$HOME/.local/bin"
  curl -L "https://github.com/marler8997/anyzig/releases/latest/download/anyzig-${arch}-${os}.tar.gz" | tar xz -C "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

if command -v zig >/dev/null 2>&1; then
  echo "anyzig installed successfully: $(zig any version 2>/dev/null || zig version)"
else
  echo "Install may have failed. See: https://github.com/marler8997/anyzig#installation"
fi
