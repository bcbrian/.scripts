" ~/.config/nvim/init.vim with the following content
" this allows us to link them
" set runtimepath^=/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.scripts/nvim/init.vim

" load default setup
source ~/.scripts/nvim/sets.vim
source ~/.scripts/nvim/plugs.vim
source ~/.scripts/nvim/cocsetup.vim
" source ~/.scripts/nvim/nvimlsp.vim
source ~/.scripts/nvim/color-setup.vim
source ~/.scripts/nvim/airline-setup.vim
source ~/.scripts/nvim/telescope-setup.vim
source ~/.scripts/nvim/vim-test-setup.vim
source ~/.scripts/nvim/vim-which-key-setup.vim
