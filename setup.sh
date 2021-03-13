##############
# SHOW LOGOS #
##############
cd ~
clear
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/logo.sh)"
#######################
# START SETUP TOOLING #
#######################
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/git.sh)"
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/zsh.sh)"
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/ohmyzsh.sh)"
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/nvm.sh)"
sh -c "$(curl -fsSL https://scripts.codesagas.dev/setup/nvim.sh)"
zsh
source ~/.zshrc

##############
# NEXT STEPS #
##############
# Can I just run this?
echo "SOME THINGS TO DO..."
echo "*******************************************************"
echo "* ssh-keygen -t ed25519 -C \"your_email@example.com\" *"
echo "*******************************************************"
echo "*************************************************************"
echo "* cd ~ && git clone https://github.com/bcbrian/.scripts.git *"
echo "*************************************************************"
echo "**********************************"
echo "* open nvim and run plug install *"
echo "**********************************"
echo "***************************************"
echo "* setup nvim config file to load mine *"
echo "***************************************"




