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
    echo -n "what is your git user name? (for git config)"
    read GIT_USER_NAME
    git config --global user.name $USER_NAME
fi
echo "git user name is setup"

if [[ $(git config user.email) == "" ]]
  then
    echo -n "what is your git user email? (for git config)"
    read GIT_USER_EMAIL
    git config --global user.email $GIT_USER_EMAIL
  fi
echo "git user email is setup"
