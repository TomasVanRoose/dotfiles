" ========== Plugins ==========
call plug#begin()

" Colorscheme
Plug 'arcticicestudio/nord-vim'

" Autocompletion
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe'
" Generator for C completion
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Coffeescript
"Plug 'kchmck/vim-coffee-script'

" Load virtualenv that is active
Plug 'plytophogy/vim-virtualenv'

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" LaTeX
Plug 'lervag/vimtex'

call plug#end()

" ========== General Config ==========
set number
set relativenumber
set showcmd
set showmode
set autoread
set ignorecase
set smartcase
set backspace=indent,eol,start

set clipboard+=unnamed

set mouse=a

" ========== Remaps ==========
inoremap jk <Esc>
inoremap jj j
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Toggle search
noremap , :set hlsearch! hlsearch?<cr>

" Easy split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

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

"let g:virtualenv_auto_activate = 1
let g:ale_completion_enabled = 1

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2
