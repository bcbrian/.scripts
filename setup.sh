##############
# SHOW LOGOS #
##############
export SKIP_LOGO=1
cd ~
clear

# Bootstrap: fetch from repo (raw GitHub) so we always use latest
SCRIPTS_RAW="${SCRIPTS_RAW:-https://raw.githubusercontent.com/bcbrian/.scripts/main}"
curl --silent -o- "$SCRIPTS_RAW/setup/logo.sh" | bash
#######################
# START SETUP TOOLING #
#######################
# Clone the repo (public git clone; self-bootstraps git). Everything else runs
# from the cloned repo via the single-source-of-truth order. gh, brew, and all
# tooling install inside that run — clone is the only pre-repo step.
curl --silent -o- "$SCRIPTS_RAW/setup/clone-scripts.sh" | bash

# Run all setup scripts from repo (single source of truth, same as update)
SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/.scripts}"
bash "$SCRIPTS_DIR/setup/run-setup-scripts.sh"

##############
# NEXT STEPS #
##############
echo "SOME THINGS TO DO..."
echo "*******************************************************"
echo "* Restart your shell (or run: zsh) to load the new env    *"
echo "* nvim will auto-install plugins on first launch (LazyVim) *"
echo "*******************************************************"




