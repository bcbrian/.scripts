
call plug#begin('~/.local/share/nvim/plugged')

Plug 'haishanh/night-owl.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

let g:SuperTabDefaultCompletionType = "<c-n>"


" theme setup
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme night-owl

" Airline Setup
set laststatus=2
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#ale#enabled = 1


