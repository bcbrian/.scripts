##############
# tree-sitter-cli + C compiler #
##############
# For nvim-treesitter (parses on first use). Idempotent: skips if already installed.

source ~/.zshrc 2>/dev/null || true

echo "**********************************"
echo "* tree-sitter + C compiler deps  *"
echo "**********************************"

# tree-sitter-cli (nvim-treesitter needs the CLI, not just the library)
if ! $(command -v tree-sitter >/dev/null 2>&1); then
  if $(command -v brew >/dev/null 2>&1); then
    echo "Installing tree-sitter-cli via Homebrew..."
    brew install tree-sitter-cli 2>/dev/null || true
  elif $(command -v npm >/dev/null 2>&1); then
    echo "Installing tree-sitter-cli via npm..."
    npm install -g tree-sitter-cli 2>/dev/null || true
  else
    echo "tree-sitter-cli not found. Install via: brew install tree-sitter or npm install -g tree-sitter-cli"
  fi
else
  echo "* tree-sitter installed *"
fi

# C compiler (gcc/clang)
if ! $(command -v gcc >/dev/null 2>&1) && ! $(command -v clang >/dev/null 2>&1); then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! xcode-select -p >/dev/null 2>&1; then
      echo "C compiler missing. Running xcode-select --install (opens GUI)..."
      xcode-select --install 2>/dev/null || true
    else
      echo "* C compiler (Xcode) present *"
    fi
  elif $(command -v apt-get >/dev/null 2>&1); then
    echo "Installing build-essential via apt..."
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y build-essential 2>/dev/null || true
  else
    echo "C compiler not found. Install build-essential (apt) or xcode-select --install (macOS)"
  fi
else
  echo "* C compiler installed *"
fi
