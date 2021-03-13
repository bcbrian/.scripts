#############
# setup zsh #
#############

if $(command -v zsh >/dev/null )
then
  echo "*****************"
  echo "* zsh installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing zsh *"
  echo "******************"
  exit 1
  sudo apt update
  sudo apt install zsh
  zsh --version
  chsh -s $(which zsh)
  zsh
fi