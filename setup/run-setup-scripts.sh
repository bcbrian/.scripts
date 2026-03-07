##############
# Run all setup scripts (single source of truth) #
##############
# Used by both setup.sh and update.sh.

export SKIP_LOGO=1
source ~/.zshrc 2>/dev/null || true

SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/.scripts}"
source "$SCRIPTS_DIR/setup/scripts-order.sh"

for script in "${SETUP_SCRIPTS[@]}"; do
  if [[ "$script" == "ohmyzsh.sh" || "$script" == "nvm.sh" ]]; then
    zsh "$SCRIPTS_DIR/setup/$script"
  else
    bash "$SCRIPTS_DIR/setup/$script"
  fi
done
