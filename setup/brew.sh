################
# setup brew #
################

if command -v brew >/dev/null 2>&1; then
  echo "**********************"
  echo "* brew installed *"
  echo "**********************"
  brew update 2>/dev/null || true
else
  echo "***********************"
  echo "* installing brew *"
  echo "***********************"

  if [[ "$OSTYPE" == darwin* ]] || [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Download then run separately so the installer can prompt for sudo via TTY
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /tmp/brew-install.sh
    /bin/bash /tmp/brew-install.sh </dev/tty
    rm -f /tmp/brew-install.sh

    # Add brew to PATH for the rest of this session
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ "$OSTYPE" == darwin* ]]; then
      if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
      fi
    fi
  else
    echo "Unsupported OS for Homebrew. Please install manually: https://brew.sh"
    exit 1
  fi
fi
