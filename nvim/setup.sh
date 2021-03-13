source .zshrc
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
source .zshrc
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev\

git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
source ~/.zshrc
pyenv install 3.7.1
pyenv virtualenv 3.7.1 neovim3
pyenv activate neovim3
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
source ~/.zshrc
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
source ~/.zshrc
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 < /dev/tty
sudo update-alternatives --config vi < /dev/tty
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 < /dev/tty
sudo update-alternatives --config vim < /dev/tty
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 < /dev/tty
sudo update-alternatives --config editor < /dev/tty
source ~/.zshrc
mkdir ~/.config
mkdir ~/.config/nvim
source ~/.zshrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.config/nvim/init.vim
source ~/.zshrc