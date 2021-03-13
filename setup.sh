##############
# SHOW LOGOS #
##############
curl -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/logo.sh | bash
#######################
# START SETUP TOOLING #
#######################
curl --silent -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/git.sh | bash
curl --silent -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/zsh.sh | bash
curl --silent -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/ohmyzsh.sh | bash
curl --silent -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/nvm.sh | bash
curl --silent -o- https://raw.githubusercontent.com/bcbrian/.scripts/main/setup/nvim.sh | bash


