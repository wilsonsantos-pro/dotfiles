set number
set colorcolumn=80
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sainnhe/gruvbox-material'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-syntastic/syntastic' " syntax checking (several languages)

" Language pack
Plugin 'sheerun/vim-polyglot'

Plugin 'tpope/vim-surround'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" File browsing
Plugin 'scrooloose/nerdtree'

" Python stuff
Plugin 'davidhalter/jedi-vim' 
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'petobens/poet-v'
" Plugin 'nvie/vim-flake8'
Plugin 'psf/black' " black formatter
" After installing black:
" $ cd ~/.vim/bundle/black
" $ git checkout origin/stable -b stable
 

" Git Integration
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See the docstrings for folder code
let g:SimpylFold_docstring_preview=1

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Indentation for FE
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
set background=dark
colorscheme gruvbox-material

set guifont=FiraCode\ 9

call togglebg#map("<F5>")

let python_highlight_all=1
syntax on

" Tabs
nnoremap tn :tabnew<space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabclose<CR>

" Clipboard: ctrl-c ctrl-v ctrl-x
if has("clipboard")
    vnoremap <C-X> "+x
    vnoremap <C-C> "+y
    vnoremap <C-V> "+gP
endif

" Make ctrl-v work in insert mode
if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

" Map semicolon to colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Settings for vim-powerline
set laststatus=2

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Hide file in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeToggle<CR>

" Ctrl-p
let g:ctrlp_open_file = 't' " open file in new tab
let g:ctrlp_open_new_file = 't' " open file in new tab

" Black
" To run Black on save:
autocmd BufWritePre *.py execute ':Black'
" To run Black on a key press (e.g. F9 below):
nnoremap <F9> :Black<CR>

