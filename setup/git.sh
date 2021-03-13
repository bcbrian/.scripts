version=$(git --version || false)
if [[ version ]]
then
  echo "*****************"
  echo "* git installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing git *"
  echo "******************"
fi