##############
# gh auth    #
##############

source ~/.zshrc 2>/dev/null || true

if ! $(command -v gh >/dev/null)
then
  echo "gh required. Run setup/gh.sh first."
  exit 1
fi

if gh auth status >/dev/null 2>&1
then
  echo "*************************"
  echo "* gh already logged in *"
  echo "*************************"
else
  echo "**************************"
  echo "* logging in to gh       *"
  echo "**************************"
  echo "Follow the prompts (browser or token). Choose SSH when asked to set up git credentials."
  gh auth login
fi
