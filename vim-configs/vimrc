call plug#begin()
Plug 'tpope/vim-sensible'

" Python specific folding
Plug 'tmhedberg/SimpylFold'

" Python specific indenting
Plug 'vim-scripts/indentpython.vim'

" Python autocomplete plugin
Plug 'Valloric/YouCompleteMe'

" Python syntax highlighting
Plug 'vim-syntastic/syntastic'

" Python PEP 8 checks
Plug 'nvie/vim-flake8'

" Add file tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Enrich status bar
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Add JavaScript highlighting
Plug 'pangloss/vim-javascript'

call plug#end()


" Some essential options
set hlsearch " highlight all search results
set ignorecase "ignore casing when searching
set smartcase "if searching uppercase stick with it
set incsearch "show incremental search results
set number "display line number
" in case you want to have the 4 above as a one liner :set hls ic is nu
set encoding=utf-8
nnoremap <SPACE> <Nop>
let mapleader=" "
let python_highlight_all=1
syntax on
" Ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" split screen settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
set nofoldenable
let g:SimpylFold_docstring_preview=1
nnoremap <space> za
vnoremap <space> zf

" Python specific indentation
au BufNewFile,BufRead *.py
    \set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix


" Other languages space adjustments
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2


" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


