##############
# Run all setup scripts (single source of truth) #
##############
# Used by both setup.sh and update.sh.

export SKIP_LOGO=1
source ~/.zshrc 2>/dev/null || true

SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/.scripts}"
source "$SCRIPTS_DIR/setup/scripts-order.sh"

for script in "${SETUP_SCRIPTS[@]}"; do
  if [[ "$script" == "ohmyzsh.sh" || "$script" == "nvm.sh" || "$script" == "bun.sh" ]]; then
    zsh "$SCRIPTS_DIR/setup/$script"
  else
    bash "$SCRIPTS_DIR/setup/$script"
  fi

  # Each script runs in its own process, so brew.sh's PATH eval doesn't carry
  # over. After brew installs, put it on PATH here so every later script (run
  # as a fresh process) can find brew.
  if [[ "$script" == "brew.sh" ]]; then
    if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi
done
