if $(command -v nvm >/dev/null )
then
  echo "*****************"
  echo "* nvm installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing nvm *"
  echo "******************"
  # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi