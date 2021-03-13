version=$(git --version)
if [[ version ]]
then
  echo "*****************"
  echo "* git installed *"
  echo "*****************"
else
  echo "******************" &&
  echo "* installing git *" &&
  echo "******************"
fi