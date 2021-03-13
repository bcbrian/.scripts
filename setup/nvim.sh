if $(command -v nvim >/dev/null )
then
  echo "******************"
  echo "* nvim installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing nvim *"
  echo "*******************"
  curl --silent -o- https://scripts.codesagas.dev/nvim/setup.sh | bash
fi