
call plug#begin('~/.local/share/nvim/plugged')

Plug 'haishanh/night-owl.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim which key so I can reference key binding that I created and dont
" remember
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" tree sitter 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nvim lsp
" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'

" TDD via vim-test
Plug 'vim-test/vim-test'

" Initialize plugin system
call plug#end()


