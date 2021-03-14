" ~/.config/nvim/init.vim with the following content
" this allows us to link them
" set runtimepath^=/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.scripts/nvim/init.vim

" load default setup
source ~/.scripts/nvim/sets.vim
source ~/.scripts/nvim/plugs.vim
