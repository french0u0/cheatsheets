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
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  rightb term
"  if has('win32')
"    echo "Someone please open the Window(s)!"
"  endif
"  if has('macunix')
"    rightb term
"  endif
"  if has('unix')
"    split term://bash
"  endif
  resize 15
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
nnoremap <C-p> :FZF<Cr>
" terminal
nnoremap <c-n> :call OpenTerminal()<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Don't change below line, see: https://vi.stackexchange.com/a/33177
tnoremap <Esc> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>ZQ

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

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
set clipboard=unnamedplus
