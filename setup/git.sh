#############
# setup git #
#############

if $(command -v git >/dev/null); then
  echo "*****************"
  echo "* git installed *"
  echo "*****************"
  # Upgrade to latest when already installed
  if [[ "$OSTYPE" == darwin* ]] && $(command -v brew >/dev/null 2>&1); then
    brew upgrade git 2>/dev/null || true
  elif [[ "$OSTYPE" == "linux-gnu"* ]] && $(command -v apt-get >/dev/null 2>&1); then
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y --only-upgrade git 2>/dev/null || true
  fi
else
  echo "******************"
  echo "* installing git *"
  echo "******************"

  if [[ "$OSTYPE" == darwin* ]]; then
    if $(command -v brew >/dev/null 2>&1); then
      brew install git
    else
      echo "Git not found. Install Xcode CLI (xcode-select --install) or Homebrew + brew install git"
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y git 2>/dev/null || true
  else
    echo "Not supported yet. Please install git before continuing."
    exit 1
  fi
fi

## setting up the git user (skip prompts when non-interactive e.g. during update)

if [[ -t 0 ]]; then
  if [[ -z "$(git config user.name 2>/dev/null)" ]]; then
    read -p "what is your git user name? (for git config) " GIT_USER_NAME
    git config --global user.name "$GIT_USER_NAME"
  fi
  if [[ -z "$(git config user.email 2>/dev/null)" ]]; then
    read -p "what is your git user email? (for git config) " GIT_USER_EMAIL
    git config --global user.email "$GIT_USER_EMAIL"
  fi
fi
echo "git user name is setup"
echo "git user email is setup"


