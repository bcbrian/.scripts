##############
# setup java #
##############
# OpenJDK via brew on both macOS and Linux/WSL.

source ~/.zshrc 2>/dev/null || true

if command -v java >/dev/null 2>&1 || command -v javac >/dev/null 2>&1
then
  echo "******************"
  echo "* java installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing java *"
  echo "*******************"

  if command -v brew >/dev/null 2>&1; then
    brew install openjdk
  else
    echo "brew required. brew.sh should have installed it first."
    exit 1
  fi

  # --- apt fallback (commented while standardizing on brew) ---
  # sudo apt update
  # sudo apt -y install default-jre
  # sudo apt -y install default-jdk
fi
