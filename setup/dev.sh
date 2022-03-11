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
  sudo apt install default-jre
  sudo apt install default-jdk
fi
