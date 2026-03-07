##############
# setup lazyvim #
##############

source ~/.zshrc 2>/dev/null || true

if [[ -d ~/.config/nvim ]] && [[ -f ~/.config/nvim/lua/config/lazy.lua ]]
then
  echo "**********************"
  echo "* lazyvim installed  *"
  echo "**********************"
else
  if ! $(command -v nvim >/dev/null)
  then
    echo "Neovim required. Run nvim setup first."
    exit 1
  fi

  if [[ ! -d ~/.scripts/lazyvim ]]
  then
    echo "~/.scripts/lazyvim not found. Run clone-scripts step first."
    exit 1
  fi

  echo "***********************"
  echo "* installing lazyvim   *"
  echo "***********************"

  # Backup existing config if present and not already LazyVim
  if [[ -d ~/.config/nvim ]] && [[ ! -f ~/.config/nvim/lua/config/lazy.lua ]]
  then
    echo "Backing up existing ~/.config/nvim to ~/.config/nvim.bak"
    rm -rf ~/.config/nvim.bak
    mv ~/.config/nvim ~/.config/nvim.bak
  fi

  # Symlink LazyVim config from repo (config in repo, edits are live)
  rm -rf ~/.config/nvim
  ln -sf ~/.scripts/lazyvim ~/.config/nvim

  # Bootstrap plugins
  echo "Bootstrapping LazyVim plugins..."
  nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

  echo "LazyVim installed. Run 'nvim' to start."
fi
