source ~/.zshrc
if $(command -v java >/dev/null ) || $(command -v javac >/dev/null )
then
  echo "******************"
  echo "* java installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing java *"
  echo "*******************"
  sudo apt update
  sudo apt -y install default-jre
  sudo apt -y install default-jdk
fi
