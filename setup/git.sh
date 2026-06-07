#############
# setup git #
#############
# git is bootstrapped pre-brew (clone-scripts / brew prereqs). Here we just
# brew-upgrade it and set the user config.

if command -v git >/dev/null 2>&1; then
  echo "*****************"
  echo "* git installed *"
  echo "*****************"
  # Keep latest via brew (single package manager).
  if command -v brew >/dev/null 2>&1; then
    brew upgrade git 2>/dev/null || brew install git 2>/dev/null || true
  fi
  # --- apt fallback (commented while standardizing on brew) ---
  # elif [[ "$OSTYPE" == "linux-gnu"* ]] && command -v apt-get >/dev/null 2>&1; then
  #   sudo apt-get update -qq 2>/dev/null || true
  #   sudo apt-get install -y --only-upgrade git 2>/dev/null || true
else
  echo "******************"
  echo "* installing git *"
  echo "******************"
  if command -v brew >/dev/null 2>&1; then
    brew install git
  else
    echo "git not found and brew unavailable. brew.sh should have installed git."
    exit 1
  fi
  # --- apt fallback (commented while standardizing on brew) ---
  # elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  #   sudo apt-get update -qq 2>/dev/null || true
  #   sudo apt-get install -y git 2>/dev/null || true
fi

## setting up the git user (attended: read from the terminal even when the
## outer setup was piped through `curl | bash`)

if [[ -e /dev/tty ]]; then
  if [[ -z "$(git config user.name 2>/dev/null)" ]]; then
    read -p "what is your git user name? (for git config) " GIT_USER_NAME </dev/tty
    [[ -n "$GIT_USER_NAME" ]] && git config --global user.name "$GIT_USER_NAME"
  fi
  if [[ -z "$(git config user.email 2>/dev/null)" ]]; then
    read -p "what is your git user email? (for git config) " GIT_USER_EMAIL </dev/tty
    [[ -n "$GIT_USER_EMAIL" ]] && git config --global user.email "$GIT_USER_EMAIL"
  fi
fi
echo "git user name is setup"
echo "git user email is setup"
