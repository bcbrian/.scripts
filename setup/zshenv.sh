###################################
# wire up ~/.zshenv include block #
###################################
# .zshenv loads for every zsh invocation (interactive or not) — unlike
# .zshrc, which only loads for interactive shells. This is what lets
# non-interactive contexts (plugin lifecycle hooks, scripts, cron) pick up
# node/nvm via ~/.scripts/zsh/.myzshenv. Idempotent: safe to re-run.

if [ -f ~/.zshenv ] && grep -q "source ~/.scripts/zsh/.myzshenv" ~/.zshenv 2>/dev/null; then
  echo "***********************"
  echo "* .zshenv wired up    *"
  echo "***********************"
else
  {
    echo "# INCLUDE CUSTOM ZSHENV"
    echo "if [ -f ~/.scripts/zsh/.myzshenv ]; then"
    echo "    source ~/.scripts/zsh/.myzshenv"
    echo "else"
    echo "    print \"404: ~/.scripts/zsh/.myzshenv not found.\""
    echo "    print \"*************************************************************\""
    echo "    print \"* cd ~ && git clone https://github.com/bcbrian/.scripts.git *\""
    echo "    print \"*************************************************************\""
    echo "fi"
    echo "# END INCLUDE CUSTOM ZSHENV"
  } >> ~/.zshenv
  echo "**************************"
  echo "* .zshenv wired up (new) *"
  echo "**************************"
fi
