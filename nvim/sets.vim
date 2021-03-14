set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/indodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80

" Give messages more display space
set cmdheight=2

" shorten updatetime
set updatetime=50

" Dont pass messages to |ins-completeion-menu|
set shortmess+=c


" sets I added
set showmatch           " Show matching brackets.
" set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set sidescrolloff=8
set nostartofline       " Do not jump to first character with page commands.
" set ignorecase          " Make searching case insensitive
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" VISUAL STYLE OF THE EDITOR
" 
highlight Normal guibg=none

" MAPPING
let mapleader = " "
" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q


" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>v <C-W><C-V>
nnoremap <Leader>e <C-W><C-S>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" " Relative numbering
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set nornu
"     set number
"   else
"     set rnu
"   endif
" endfunc

" " Toggle between normal and relative numbering.
" nnoremap <leader>r :call NumberToggle()<cr>