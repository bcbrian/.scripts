# NVM bootstrap only — safe to source from both interactive (.myzshrc) and
# non-interactive (.zshenv) contexts. No cd, no network calls, no side effects
# beyond putting node/nvm on PATH. Keep this file minimal.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
