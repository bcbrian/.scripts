##############
# setup macmon #
##############
# Sudoless performance monitor for Apple Silicon. macOS only.

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Skipping macmon (macOS only)"
  exit 0
fi

if $(command -v macmon >/dev/null 2>&1); then
  echo "*********************"
  echo "* macmon installed  *"
  echo "*********************"
  exit 0
fi

echo "**********************"
echo "* installing macmon  *"
echo "**********************"

if $(command -v brew >/dev/null 2>&1); then
  brew install macmon 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  exit 1
fi

if $(command -v macmon >/dev/null 2>&1); then
  echo "macmon installed successfully."
else
  echo "Install may have failed. See: https://github.com/vladkens/macmon"
fi
