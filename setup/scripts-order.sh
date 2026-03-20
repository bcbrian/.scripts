##############
# Setup scripts order - single source of truth #
##############
# Used by both setup.sh and update.sh to avoid drift.

SETUP_SCRIPTS=(
  "brew.sh"
  "git.sh"
  "gh.sh"
  "gh-auth.sh"
  "clone-scripts.sh"
  "zsh.sh"
  "ohmyzsh.sh"
  "nvm.sh"
  "bun.sh"
  "nvim.sh"
  "lazyvim-deps.sh"
  "lazygit.sh"
  "tree-sitter-deps.sh"
  "cursor.sh"
  "lazyvim.sh"
)
