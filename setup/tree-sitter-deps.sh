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
  else
    echo "brew required. brew.sh should have installed it first."
    # --- npm fallback (commented while standardizing on brew) ---
    # elif $(command -v npm >/dev/null 2>&1); then
    #   npm install -g tree-sitter-cli 2>/dev/null || true
  fi
else
  echo "* tree-sitter installed *"
fi

# C compiler (gcc/clang). On Linux this comes from build-essential, which
# brew.sh installs as a brew prerequisite. On macOS it's the Xcode CLT.
if ! $(command -v gcc >/dev/null 2>&1) && ! $(command -v clang >/dev/null 2>&1); then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! xcode-select -p >/dev/null 2>&1; then
      echo "C compiler missing. Running xcode-select --install (opens GUI)..."
      xcode-select --install 2>/dev/null || true
    else
      echo "* C compiler (Xcode) present *"
    fi
  elif $(command -v brew >/dev/null 2>&1); then
    echo "Installing gcc via Homebrew..."
    brew install gcc 2>/dev/null || true
  else
    echo "C compiler not found (expected from brew.sh's build-essential prereq)."
    # --- apt fallback (commented while standardizing on brew) ---
    # sudo apt-get update -qq 2>/dev/null || true
    # sudo apt-get install -y build-essential 2>/dev/null || true
  fi
else
  echo "* C compiler installed *"
fi
