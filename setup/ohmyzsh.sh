if $(command -v ohmyzsh >/dev/null)
  then
    echo "*********************"
    echo "* ohmyzsh installed *"
    echo "*********************"
  else
    if [[ $(command -v zsh >/dev/null) && $(command -v git >/dev/null)]]
      then
        echo "*********************"
        echo "* prereqs installed *"
        echo "*********************"        
       # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
      else
        echo "*************************"
        echo "* prereqs not installed *"
        echo "*************************"
        exit 1;
    fi
fi