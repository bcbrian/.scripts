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
  sudo apt install zsh < /dev/tty
  zsh --version
  chsh -s $(which zsh)
  zsh
fi