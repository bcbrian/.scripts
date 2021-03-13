if [ -d ~/.oh-my-zsh ]
  then
    echo "*********************"
    echo "* ohmyzsh installed *"
    echo "*********************"
  else
    if $(command -v zsh >/dev/null) && $(command -v git >/dev/null)
      then
        echo "*********************"
        echo "* prereqs installed *"
        echo "*********************"  

              
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "# INCLUDE CUSTOM RC" >> ~/.zshrc
        echo "if [ -f ~/.scripts/zsh/.myzshrc ]; then" >> ~/.zshrc
        echo "    source ~/.scripts/zsh/.myzshrc" >> ~/.zshrc
        echo "else" >> ~/.zshrc
        echo "    print \"404: ~/.scripts/zsh/.myzshrc not found.\"" >> ~/.zshrc
        echo "    print \"*************************************************************\"" >> ~/.zshrc
        echo "    print \"* cd ~ && git clone https://github.com/bcbrian/.scripts.git *\"" >> ~/.zshrc
        echo "    print \"*************************************************************\"" >> ~/.zshrc
        echo "fi" >> ~/.zshrc
        echo "# END INCLUDE CUSTOM RC" >> ~/.zshrc
      else
        echo "*************************"
        echo "* prereqs not installed *"
        echo "*************************"
        exit 1;
    fi
fi