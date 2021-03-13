version=$(git --version)
if [[ version ]]
then
  echo "We have git!"
else
  echo "We dont have git!"
fi