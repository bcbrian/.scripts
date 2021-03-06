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
  sudo apt update
  sudo apt -y install zsh
  zsh --version
  chsh -s $(which zsh)
  zsh
fi