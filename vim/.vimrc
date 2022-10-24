call plug#begin()
  Plug 'preservim/NERDTree'
  Plug 'junegunn/fzf'
call plug#end()

set number
set ignorecase
set smartcase
set hlsearch
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4

" Set Enter to clear search highlights
nnoremap <silent> <CR> :nohlsearch<CR><CR>


