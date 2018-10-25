call plug#begin()
    Plug 'jlanzarotta/bufexplorer'
    Plug 'othree/yajs.vim'
    Plug 'othree/es.next.syntax.vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'gavocanov/vim-js-indent'
    " Plug 'pangloss/vim-javascript'
    Plug 'moll/vim-node'
    Plug 'mxw/vim-jsx'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'kien/ctrlp.vim'
    Plug 'bling/vim-airline'
    Plug 'w0rp/ale'
    Plug 'leafgarland/typescript-vim'
call plug#end()

set nocompatible

set ruler
set modeline
set modelines=1000
set laststatus=2
set ttimeoutlen=50
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set list listchars=tab:>-,trail:~
syntax on
set t_Co=256
colorscheme xoria256
set visualbell
set t_vb=
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
set scrolloff=4
set dir=~/tmp

let g:ale_linters = {
\   'typescript': ['tsserver'],
\   'javascript': ['eslint'],
\}

let g:used_javascript_libs = 'jquery,underscore,react'

map <F2> :e %:p:h<CR>
map <F3> gf<CR>
map <F4> :bd<CR>

map <F5> :BufExplorer<CR>
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSortBy = 'number'

map <F6> :bnext<CR>
map <S-F6> :bprev<CR>
nnoremap [[ :lprev<CR>
nnoremap ]] :lnext<CR>

nnoremap \\ :nohlsearch<CR>
vnoremap // y/<C-R>"<CR>
vnoremap <C-R> "hy:%s/<C-R>h//g<LEFT><LEFT>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

