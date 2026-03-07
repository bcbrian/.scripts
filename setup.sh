##############
# SHOW LOGOS #
##############
cd ~
clear
curl --silent -o- https://scripts.codesagas.dev/setup/logo.sh | bash
#######################
# START SETUP TOOLING #
#######################
curl --silent -o- https://scripts.codesagas.dev/setup/git.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/gh.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/gh-auth.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/clone-scripts.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/zsh.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/ohmyzsh.sh | zsh
curl --silent -o- https://scripts.codesagas.dev/setup/nvm.sh | zsh
curl --silent -o- https://scripts.codesagas.dev/setup/nvim.sh | zsh
curl --silent -o- https://scripts.codesagas.dev/setup/cursor.sh | bash
curl --silent -o- https://scripts.codesagas.dev/setup/lazyvim.sh | zsh
zsh
source ~/.zshrc

##############
# NEXT STEPS #
##############
echo "SOME THINGS TO DO..."
echo "*******************************************************"
echo "* nvim will auto-install plugins on first launch (LazyVim) *"
echo "*******************************************************"




