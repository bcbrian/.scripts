##############
# setup git-xet #
##############
# Git LFS extension for Hugging Face models via the Xet protocol.
# Requires post-install registration in global git config.

if $(command -v git-xet >/dev/null 2>&1); then
  echo "*********************"
  echo "* git-xet installed *"
  echo "*********************"
else
  echo "**********************"
  echo "* installing git-xet *"
  echo "**********************"

  if $(command -v brew >/dev/null 2>&1); then
    brew install git-xet 2>/dev/null || true
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi
fi

# Register xet as a git LFS transfer agent in ~/.gitconfig (idempotent).
if $(command -v git-xet >/dev/null 2>&1); then
  git xet install
  echo "git-xet registered in global git config."
else
  echo "Install may have failed. See: https://github.com/huggingface/xet-core"
fi
