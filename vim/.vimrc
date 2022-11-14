" Checkout https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/ for more fzf tips, only looked at it quickly

" PLUGINS
call plug#begin()
  Plug 'preservim/NERDTree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" NERDTREE
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" TERMINAL
if has('win32')
  " set shell="C:/Program\ Files/WindowsApps/Microsoft.PowerShell_7.2.7.0_x64__8wekyb3d8bbwe/pwsh.exe\"
  set shell=pwsh.exe
endif
if has('unix')
  " Empty for now
endif

" start terminal in insert mode
autocmd TermOpen * startinsert

function! OpenTerminal()
  rightb split
  term
  resize 15
endfunction

" REMAPS
" leader, first make sure space is de-mapped
nnoremap <SPACE> <Nop>
let mapleader=" "
" show buffers
nnoremap <leader>b :ls<CR>
" open init vim, source and plugin install
nnoremap <leader>1 :e ~/AppData/Local/nvim/init.vim<CR>
nnoremap <leader>2 :source ~/AppData/Local/nvim/init.vim<CR>
nnoremap <leader>3 :PlugInstall<CR>
nnoremap <leader>0 :VimBeGood<CR>
" highlights (clear)
nnoremap <silent> <CR> :nohlsearch<CR><CR>
" fzf
nnoremap <leader>p :FZF<CR>
" Nerdtree
silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
" terminal
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>n :call OpenTerminal()<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
" Don't change below line, see: https://vi.stackexchange.com/a/33177
tnoremap <Esc> <C-\><C-n>
nnoremap <Esc><Esc> <C-\><C-n>ZQ
tnoremap <Esc><Esc> <C-\><C-n>ZQ
" Keep visual block selected after indent
:vnoremap < <gv
:vnoremap > >gv

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
set relativenumber
set ignorecase
set smartcase
set hlsearch
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
set expandtab
