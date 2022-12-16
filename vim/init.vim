" Checkout https://www.jakewiesler.com/blog/getting-started-with-vim
" Checkout https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/ for more fzf tips, only looked at it quickly
" PLUGINS
call plug#begin()
  Plug 'preservim/NERDTree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'nvim-tree/nvim-web-devicons'
  "Plug 'romgrk/barbar.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

autocmd VimEnter * NERDTreeToggle | wincmd w
"autocmd VimEnter wincmd w

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
"let g:airline_theme='simple'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTREE
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()


"" Move to previous/next
"nnoremap <silent> <A-,> <Cmd>BufferPrevious<CR>
"nnoremap <silent> <A-.> <Cmd>BufferNext<CR>
"tnoremap <silent> <A-,> <Cmd>BufferPrevious<CR>
"tnoremap <silent> <A-.> <Cmd>BufferNext<CR>
"" Re-order to previous/next
"nnoremap <silent> <A-<> <Cmd>BufferMovePrevious<CR>
"nnoremap <silent> <A->> <Cmd>BufferMoveNext<CR>
"" Goto buffer in position...
"nnoremap <silent> <A-1> <Cmd>BufferGoto 1<CR>
"nnoremap <silent> <A-2> <Cmd>BufferGoto 2<CR>
"nnoremap <silent> <A-3> <Cmd>BufferGoto 3<CR>
"nnoremap <silent> <A-4> <Cmd>BufferGoto 4<CR>
"nnoremap <silent> <A-5> <Cmd>BufferGoto 5<CR>
"nnoremap <silent> <A-6> <Cmd>BufferGoto 6<CR>
"nnoremap <silent> <A-7> <Cmd>BufferGoto 7<CR>
"nnoremap <silent> <A-8> <Cmd>BufferGoto 8<CR>
"nnoremap <silent> <A-9> <Cmd>BufferGoto 9<CR>
"nnoremap <silent> <A-0> <Cmd>BufferLast<CR>
"" Pin/unpin buffer
"nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
"" Close buffer
"nnoremap <silent>    <leader>w <Cmd>BufferClose<CR>
"nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
"" Wipeout buffer
""                          :BufferWipeout
"" Close commands
""                          :BufferCloseAllButCurrent
""                          :BufferCloseAllButVisible
""                          :BufferCloseAllButPinned
""                          :BufferCloseAllButCurrentOrPinned
""                          :BufferCloseBuffersLeft
""                          :BufferCloseBuffersRight
"" Magic buffer-picking mode
"nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
"" Sort automatically by...
"nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
"nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
"nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
"nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
"
" SCOPE
"lua require("scope").setup()

" AUTOCMD
augroup LintingGroovy
   autocmd!
   autocmd FileType groovy setlocal makeprg=npm-groovy-lint
   "autocmd BufWritePost *.groovy silent make! <afile> | silent redraw!
   autocmd QuickFixCmdPost [^l]* cwindow
augroup END

augroup LintingPython
   autocmd!
   autocmd FileType python setlocal makeprg=pylint
   autocmd BufWritePost *.py silent make! <afile> | silent redraw!
   autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" TERMINAL
if has('win32')
  " start terminal in insert mode
  autocmd TermOpen * set bufhidden=hide
  autocmd TermOpen * startinsert
endif
if has('unix')
  " start terminal in insert mode
  autocmd TermOpen * set bufhidden=hide
  autocmd TermOpen * startinsert
endif

" REMAPS
" leader, first make sure space is de-mapped
nnoremap <SPACE> <Nop>
let mapleader=" "
" windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
nnoremap <leader>- :resize -5 <CR>
nnoremap <leader>= :resize +5 <CR>
" buffers
nnoremap <leader>b :Buffers<CR>:b
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <leader>i :bn<CR>
nnoremap <silent> <leader>o :bp<CR>
" open init vim, source and plugin install
if has('win32')
   nnoremap <silent> <leader>Q :e C:\Users\fjacobs\AppData\Local\nvim\init.vim<CR>
   nnoremap <silent> <leader>W :source C:\Users\fjacobs\AppData\Local\nvim\init.vim<CR>
endif
if has('unix')
   nnoremap <silent> <leader>Q :e ~/.config/nvim/init.vim<CR>
   nnoremap <silent> <leader>W :source ~/.config/nvim/init.vim<CR>
endif
nnoremap <silent> <leader>E :PlugInstall<CR>
nnoremap <silent> <leader>R :make % <CR> \| :copen<CR>
nnoremap <silent> <leader>T :VimBeGood<CR>
" highlights (clear)
"nnoremap <silent> <CR> :nohlsearch<CR><CR>
" fzf
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>; :Lines<CR>
" nerdtree
silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
" terminal
nnoremap <leader>n :term<CR>
tnoremap <esc><esc> <C-\><C-n>
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
"let &t_SI = "\e[5 q"
"let &t_EI = "\e[4 q"

" GLOBAL SETTINGS
colorscheme gruvbox
set bg=dark
set relativenumber
set ignorecase
set smartcase
set hlsearch
set shiftwidth=3 " Size of indent
set autoindent
set smartindent
set tabstop=3 " Width of hard tabstop measured in spaces
set expandtab
set laststatus=2
set statusline=%{FugitiveStatusline()}
set mouse=a
