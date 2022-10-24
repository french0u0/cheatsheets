" Checkout https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/ for more fzf tips, only looked at it quickly

" PLUGINS
call plug#begin()
  Plug 'preservim/NERDTree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
call plug#end()

" NERDTREE
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" TERMINAL
set splitright
set splitbelow

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction

" REMAPS
" leader
nnoremap <SPACE> <Nop>
let mapleader=" "
" highlights (clear)
nnoremap <silent> <CR> :nohlsearch<CR><CR>
" vimrc and plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
" fzf
nnoremap <C-p> :GFiles<Cr>
" terminal
nnoremap <c-n> :call OpenTerminal()<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" GLOBAL SETTINGS
colorscheme gruvbox
set bg=dark
set number
set ignorecase
set smartcase
set hlsearch
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
