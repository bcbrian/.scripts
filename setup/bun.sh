#!/bin/bash

source ~/.zshrc
if $(command -v bun >/dev/null)
then
  echo "***********************"
  echo "* bun already installed *"
  echo "***********************"
else
  echo "**********************"
  echo "* installing bun *"
  echo "**********************"
  
  curl -fsSL https://bun.sh/install | bash
  # reload shell
  source ~/.zshrc
fi
