#############
# setup zsh #
#############
# Installed via brew on both macOS and Linux/WSL.

if command -v zsh >/dev/null 2>&1
then
  echo "*****************"
  echo "* zsh installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing zsh *"
  echo "******************"

  if command -v brew >/dev/null 2>&1; then
    brew install zsh
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi

  # --- apt fallback (commented while standardizing on brew) ---
  # sudo apt update
  # sudo apt -y install zsh

  zsh --version

  # Make zsh the login shell. Register the path if it's a brew zsh.
  ZSH_PATH="$(command -v zsh)"
  if ! grep -qx "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null 2>&1 || true
  fi
  if [[ -e /dev/tty ]]; then
    chsh -s "$ZSH_PATH" </dev/tty || true
  else
    chsh -s "$ZSH_PATH" || true
  fi
  # NOTE: do not launch a bare `zsh` here — it starts an interactive shell and
  # blocks the rest of setup. The shell switch takes effect on next login.
fi
