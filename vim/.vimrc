" ========== Plugins ==========
call plug#begin()

" Colorscheme
Plug 'arcticicestudio/nord-vim'

call plug#end()

" ========== General Config ==========
set number
set relativenumber
set showcmd
set showmode
set autoread
set ignorecase
set smartcase

set clipboard+=unnamed

set mouse=a

" ========== Remaps ==========
inoremap jk <Esc>
inoremap jj j
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Toggle search
noremap , :set hlsearch! hlsearch?<cr>

" ========== Appearance ==========
syntax enable
colorscheme nord
let g:nord_italic_comments = 1

" ========== Indentation ==========
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2
