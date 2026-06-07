################
# setup brew #
################
# Homebrew is the single package manager for macOS + Linux/WSL.
# Runs FIRST. Everything after this uses brew.

# Put brew on PATH if it already exists (idempotent re-runs)
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if command -v brew >/dev/null 2>&1; then
  echo "**********************"
  echo "* brew installed *"
  echo "**********************"
  brew update 2>/dev/null || true
else
  echo "***********************"
  echo "* installing brew *"
  echo "***********************"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Homebrew's documented prerequisites must exist before the installer.
    # This is the ONLY apt we keep — brew can't install brew.
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y build-essential procps curl file git
  elif [[ "$OSTYPE" == darwin* ]]; then
    # Xcode Command Line Tools provide git + a compiler for brew.
    xcode-select -p >/dev/null 2>&1 || xcode-select --install 2>/dev/null || true
  else
    echo "Unsupported OS for Homebrew. Please install manually: https://brew.sh"
    exit 1
  fi

  # Download then run separately so the installer can prompt for sudo via TTY
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /tmp/brew-install.sh
  /bin/bash /tmp/brew-install.sh </dev/tty
  rm -f /tmp/brew-install.sh

  # Add brew to PATH for the rest of this session
  if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  elif [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi
