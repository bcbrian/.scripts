####################
# setup claude-code #
####################
# Claude Code — terminal-based AI agent (Anthropic's official CLI).
# Official native installer (no Node dependency). Installs to ~/.local/bin
# (on PATH via .myzshrc). https://claude.ai/install.sh redirects to the
# claude-code-releases bootstrap.

source ~/.zshrc 2>/dev/null || true

if command -v claude >/dev/null 2>&1
then
  echo "************************"
  echo "* Claude Code installed *"
  echo "************************"
else
  echo "*************************"
  echo "* installing Claude Code *"
  echo "*************************"
  curl -fsSL https://claude.ai/install.sh | bash
  # Installs to ~/.local/bin — ensure it's on PATH for the rest of this session.
  [[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
fi
