##############
# setup codex #
##############
# OpenAI Codex CLI — terminal-based AI agent. Homebrew cask (macOS + Linux).
# Idempotent: upgrades if brew-installed, otherwise skips when present.

source ~/.zshrc 2>/dev/null || true

if command -v codex >/dev/null 2>&1; then
  echo "*******************"
  echo "* Codex installed *"
  echo "*******************"
  brew list --cask codex >/dev/null 2>&1 && brew upgrade --cask codex 2>/dev/null || true
  exit 0
fi

echo "********************"
echo "* installing Codex *"
echo "********************"

if command -v brew >/dev/null 2>&1; then
  brew install --cask codex 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  echo "  Manual: https://github.com/openai/codex#installation"
  exit 0
fi

if command -v codex >/dev/null 2>&1; then
  echo "Codex installed successfully: $(codex --version)"
else
  echo "Install may have failed. See: https://github.com/openai/codex#installation"
fi
