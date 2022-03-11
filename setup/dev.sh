source ~/.zshrc
if $(command -v java >/dev/null ) 
then
  echo "******************"
  echo "* java installed *"
  echo "******************"
else
  echo "*******************"
  echo "* installing java *"
  echo "*******************"
  
fi
