##############
# Setup scripts order - single source of truth #
##############
# Used by both setup.sh and update.sh to avoid drift.

# clone-scripts runs earlier (setup.sh curl phase) via public git clone, so it
# is not in this array. gh + gh-auth moved to the end next to the AI agents.
SETUP_SCRIPTS=(
  "brew.sh"
  "git.sh"
  "zsh.sh"
  "ohmyzsh.sh"
  "nvm.sh"
  "bun.sh"
  "java.sh"
  "nvim.sh"
  "lazyvim-deps.sh"
  "lazygit.sh"
  "tree-sitter-deps.sh"
  "lazyvim.sh"
  "gh.sh"
  "gh-auth.sh"
  "cursor.sh"
  "cursor-agent.sh"
  "claude-code.sh"
  "karabiner.sh"
  "ghostty.sh"
)
