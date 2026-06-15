##############
# setup pyenv #
##############
# Python version manager. Shell integration is added to .myzshrc.

if $(command -v pyenv >/dev/null 2>&1); then
  echo "*********************"
  echo "* pyenv installed   *"
  echo "*********************"
  exit 0
fi

echo "**********************"
echo "* installing pyenv   *"
echo "**********************"

if $(command -v brew >/dev/null 2>&1); then
  brew install pyenv 2>/dev/null || true
else
  echo "brew required. brew.sh should have installed it first."
  exit 1
fi

if $(command -v pyenv >/dev/null 2>&1); then
  echo "pyenv installed successfully."
else
  echo "Install may have failed. See: https://github.com/pyenv/pyenv"
fi
