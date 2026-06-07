##############
# clone .scripts #
##############
# Runs before brew, so it self-bootstraps git, then clones over public HTTPS.
# No gh dependency — gh installs later (via brew) next to the AI agents.

source ~/.zshrc 2>/dev/null || true

SCRIPTS_REPO_URL="${SCRIPTS_REPO_URL:-https://github.com/bcbrian/.scripts.git}"
SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/.scripts}"

if [[ -d "$SCRIPTS_DIR" ]] && [[ -d "$SCRIPTS_DIR/.git" ]]
then
  echo "*************************"
  echo "* .scripts repo present *"
  echo "*************************"
  echo "Pulling latest..."
  (cd "$SCRIPTS_DIR" && git pull --rebase 2>/dev/null) || true
else
  echo "**************************"
  echo "* cloning .scripts repo  *"
  echo "**************************"

  # Bootstrap git if missing (we are pre-brew here).
  if ! command -v git >/dev/null 2>&1
  then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt-get update -qq 2>/dev/null || true
      sudo apt-get install -y git
    elif [[ "$OSTYPE" == darwin* ]]; then
      xcode-select --install 2>/dev/null || true
      echo "Installing Xcode Command Line Tools (provides git). Re-run setup if git is still missing."
    fi
  fi

  if ! command -v git >/dev/null 2>&1
  then
    echo "git still not found. Install git, then re-run setup."
    exit 1
  fi

  if [[ -d "$SCRIPTS_DIR" ]]
  then
    echo "Removing existing $SCRIPTS_DIR (not a git repo)"
    rm -rf "$SCRIPTS_DIR"
  fi

  git clone "$SCRIPTS_REPO_URL" "$SCRIPTS_DIR"
  echo ".scripts cloned to $SCRIPTS_DIR"
fi
