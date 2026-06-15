##############
# setup git-lfs #
##############
# Git extension for versioning large files. Required by git-xet.

if $(command -v git-lfs >/dev/null 2>&1); then
  echo "*********************"
  echo "* git-lfs installed *"
  echo "*********************"
else
  echo "**********************"
  echo "* installing git-lfs *"
  echo "**********************"

  if $(command -v brew >/dev/null 2>&1); then
    brew install git-lfs 2>/dev/null || true
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi
fi

# Register LFS hooks in ~/.gitconfig (idempotent).
if $(command -v git-lfs >/dev/null 2>&1); then
  git lfs install
  echo "git-lfs initialized in global git config."
else
  echo "Install may have failed. See: https://git-lfs.com"
fi
