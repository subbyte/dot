" vim not vi compatible
set nocompatible

" auto reload when file changed outside
set autoread



let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast leaving
nmap <leader>q :qa<cr>

" Make
nmap <leader>m :!make<cr>



set hlsearch
set incsearch
set showmatch

set noerrorbells
set novisualbell


if system('uname -s') == "Darwin\n"
    " OSX
    set clipboard=unnamed 
else
    " Linux
    set clipboard=unnamedplus
endif


syntax on

" fix lost highlight bug
set regexpengine=2



set nobackup
set nowritebackup
set noswapfile


set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent



set wrap
set linebreak



set number



let g:airline_theme='onedark'
colorscheme onedark
