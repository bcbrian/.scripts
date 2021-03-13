if $(command -v nvim >/dev/null )
then
  echo "******************"
  echo "* nvim installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing nvim *"
  echo "*******************"
  sh -c "$(curl -fsSL https://scripts.codesagas.dev/nvim/setup.sh)"
fi