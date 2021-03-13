source ~/.zshrc
if $(command -v nvm >/dev/null ) || $(command -v node >/dev/null )
then
  echo "*****************"
  echo "* nvm installed *"
  echo "*****************"
else
  echo "******************"
  echo "* installing nvm *"
  echo "******************"
  
  echo 'export NVM_DIR="$HOME/.nvm"' >> .zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> .zshrc
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> .zshrc
  source ~/.zshrc

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  # reload shell
  source ~/.zshrc
  nvm install node
fi