#############
# setup gh  #
#############

source ~/.zshrc 2>/dev/null || true

if $(command -v gh >/dev/null)
then
  echo "*****************"
  echo "* gh installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing gh  *"
  echo "******************"

  if [[ "$OSTYPE" == darwin* ]]
  then
    if $(command -v brew >/dev/null); then
      brew install gh
    else
      echo "Homebrew required. Install from https://brew.sh"
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu" ]]
  then
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh -y
  else
    echo "Not supported yet please install gh before continuing."
  fi
fi
