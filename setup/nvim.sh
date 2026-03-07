if $(command -v nvim >/dev/null)
then
  echo "******************"
  echo "* nvim installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing nvim *"
  echo "*******************"
  if [[ "$OSTYPE" == darwin* ]] && $(command -v brew >/dev/null 2>&1); then
    brew install neovim
  elif [[ "$OSTYPE" == "linux-gnu"* ]] && $(command -v brew >/dev/null 2>&1); then
    brew install neovim
  elif $(command -v apt-get >/dev/null 2>&1); then
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y neovim 2>/dev/null || true
  else
    echo "Install neovim manually: brew install neovim or apt install neovim"
    exit 1
  fi
fi