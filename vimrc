" put all plugins in the opt directory:
" 1. onedark need this for vim >= 8 < 9
" 2. vim-airline need this for gvim
packadd! onedark.vim
packadd! vim-airline
packadd! vim-airline-themes
packadd! nerdtree

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
set encoding=utf8



if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set gfn=Monospace\ 12
endif



let g:airline_theme='onedark'
colorscheme onedark
