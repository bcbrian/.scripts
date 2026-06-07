####################
# setup cursor-agent #
####################
# Cursor Agent CLI — terminal-based AI agent. Official curl installer.
# Independent of the Cursor GUI app (cursor.sh) so a headless/server profile
# can install just the agent. Installs to ~/.local/bin (on PATH via .myzshrc).

source ~/.zshrc 2>/dev/null || true

# Canonical binary is `cursor-agent` (an `agent` symlink is also created).
if command -v cursor-agent >/dev/null 2>&1
then
  echo "*******************************"
  echo "* Cursor Agent CLI installed *"
  echo "*******************************"
else
  echo "*******************************"
  echo "* installing Cursor Agent CLI *"
  echo "*******************************"
  curl https://cursor.com/install -fsS | bash
  # Installs to ~/.local/bin — ensure it's on PATH for the rest of this session.
  [[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
fi
