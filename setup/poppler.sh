##############
# setup poppler #
##############
# PDF CLI tools (pdftotext, pdftoppm, pdfinfo). Claude Code's Read tool needs
# pdftoppm/pdfinfo for PDFs over 10 pages or page-range reads.
# Idempotent: skips if already installed.

if $(command -v pdftoppm >/dev/null 2>&1); then
  echo "*********************"
  echo "* poppler installed *"
  echo "*********************"
  exit 0
fi

echo "**********************"
echo "* installing poppler *"
echo "**********************"

if $(command -v brew >/dev/null 2>&1); then
  brew install poppler 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  echo "  Manual: https://poppler.freedesktop.org"
  # --- apt fallback (commented while standardizing on brew) ---
  # sudo apt-get update -qq 2>/dev/null || true
  # sudo apt-get install -y poppler-utils 2>/dev/null || true
  exit 0
fi

if $(command -v pdftoppm >/dev/null 2>&1); then
  echo "poppler installed successfully."
else
  echo "Install may have failed. See: https://poppler.freedesktop.org"
fi
