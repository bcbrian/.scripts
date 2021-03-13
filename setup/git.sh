echo "original line 1"
echo "^[[Fupdated line 1"
echo "line 2"
echo "line 3"
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