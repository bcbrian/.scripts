source ~/.zshrc
export NVM_DIR="$HOME/.nvm"

# Check for nvm itself, not node — a non-nvm node doesn't mean nvm is installed.
if [ -s "$NVM_DIR/nvm.sh" ]
then
  echo "*****************"
  echo "* nvm installed *"
  echo "*****************"
  exit 0
fi

# A node outside nvm will compete with nvm's node on PATH — remove it first.
existing_node=$(whence -p node)
if [ -n "$existing_node" ]
then
  echo "*******************************************************"
  echo "* found non-nvm node at $existing_node"
  echo "* it must be removed before installing nvm"
  echo "*******************************************************"
  if command -v brew >/dev/null && brew list --formula node &>/dev/null
  then
    read "reply?Run 'brew uninstall node' now? [y/N] " < /dev/tty
    [[ "$reply" == [yY]* ]] && brew uninstall node
  fi
  hash -r
  if whence -p node >/dev/null
  then
    echo "nvm NOT installed. Remove $(whence -p node) (and any global npm packages you need to keep), then run 'update'. Or run 'fix-nvm' to have an agent resolve it."
    exit 1
  fi
fi

echo "******************"
echo "* installing nvm *"
echo "******************"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source "$NVM_DIR/nvm.sh"
nvm install node

if ! command -v nvm >/dev/null
then
  echo "nvm install failed"
  exit 1
fi
