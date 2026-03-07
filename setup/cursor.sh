##############
# setup cursor #
##############

source ~/.zshrc 2>/dev/null || true

if $(command -v cursor >/dev/null)
then
  echo "*********************"
  echo "* cursor installed *"
  echo "*********************"
else
  echo "**********************"
  echo "* installing cursor *"
  echo "**********************"

  if [[ "$OSTYPE" == darwin* ]]
  then
    if $(command -v brew >/dev/null)
    then
      brew install --cask cursor
      # Symlink CLI to PATH (Cursor installs the app but may not add 'cursor' to PATH)
      mkdir -p /usr/local/bin 2>/dev/null || true
      ln -sf "/Applications/Cursor.app/Contents/Resources/app/bin/cursor" /usr/local/bin/cursor 2>/dev/null || true
      echo "Cursor installed. If 'cursor' command fails, open Cursor once and re-run this script."
    else
      echo "Homebrew required. Install from https://brew.sh"
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu" ]]
  then
    CURSOR_DEB="/tmp/cursor.deb"
    ARCH=$(uname -m)
    if [[ "$ARCH" == "x86_64" ]]
    then
      CURSOR_URL="https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/2.6"
    elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]
    then
      CURSOR_URL="https://api2.cursor.sh/updates/download/golden/linux-arm64-deb/cursor/2.6"
    else
      echo "Unsupported architecture: $ARCH"
      exit 1
    fi
    curl -fsSL -o "$CURSOR_DEB" "$CURSOR_URL"
    sudo dpkg -i "$CURSOR_DEB"
    rm -f "$CURSOR_DEB"
    # Symlink if not in PATH (Cursor .deb typically adds it)
    if ! $(command -v cursor >/dev/null)
    then
      CURSOR_BIN=$(find /opt /usr -name "cursor" -type f 2>/dev/null | head -1)
      if [[ -n "$CURSOR_BIN" ]]
      then
        sudo ln -sf "$CURSOR_BIN" /usr/local/bin/cursor 2>/dev/null || true
      fi
    fi
  else
    echo "Not supported yet. Please install Cursor manually from https://cursor.com/download"
    exit 1
  fi
fi

# Cursor Agent CLI (agent command for terminal/headless use)
if ! $(command -v agent >/dev/null)
then
  echo "******************************"
  echo "* installing Cursor Agent CLI *"
  echo "******************************"
  curl https://cursor.com/install -fsS | bash
  # Agent CLI installs to ~/.local/bin - ensure it's in PATH
  [[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
else
  echo "*******************************"
  echo "* Cursor Agent CLI installed *"
  echo "*******************************"
fi
