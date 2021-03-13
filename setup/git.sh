if $(command -v git >/dev/null )
then
  echo "*****************"
  echo "* git installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing git *"
  echo "******************"
fi

## setting up the git user

if [[ $(git config user.name) == "" ]]
  then
    read -p "what is your git user name? (for git config)" GIT_USER_NAME < /dev/tty
    git config --global user.name $GIT_USER_NAME
fi
echo "git user name is setup"

if [[ $(git config user.email) == "" ]]
  then
    read -p "what is your git user email? (for git config)" GIT_USER_EMAIL < /dev/tty
    git config --global user.email $GIT_USER_EMAIL
  fi
echo "git user email is setup"


