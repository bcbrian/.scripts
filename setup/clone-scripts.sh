##############
# clone .scripts #
##############

source ~/.zshrc 2>/dev/null || true

SCRIPTS_REPO="${SCRIPTS_REPO:-https://github.com/bcbrian/.scripts.git}"
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

  if ! $(command -v git >/dev/null)
  then
    echo "Git required. Run git setup first."
    exit 1
  fi

  if [[ -d "$SCRIPTS_DIR" ]]
  then
    echo "Removing existing $SCRIPTS_DIR (not a git repo)"
    rm -rf "$SCRIPTS_DIR"
  fi

  git clone "$SCRIPTS_REPO" "$SCRIPTS_DIR"
  echo ".scripts cloned to $SCRIPTS_DIR"
fi
