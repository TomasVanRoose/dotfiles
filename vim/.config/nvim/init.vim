" ========== Plugins ==========
call plug#begin()

" Colorscheme
Plug 'arcticicestudio/nord-vim'

" Syntactic highlighting
Plug 'w0rp/ale'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi' "Python

" Rust
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" LaTeX
Plug 'lervag/vimtex'

" stupid proof shit
Plug 'let-def/vimbufsync'
Plug 'the-lambda-church/coquille'

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

" Ale
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'python': ['pylint'],
\}

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#server_timeout = 20

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

" Racer (Rust autocompletion)
let g:racer_experimental_completer = 1

" Rust format on save
let g:rustfmt_command = '/Users/tomas/.cargo/bin/rustfmt'
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" Vimtex related
let g:tex_flavor = 'tex'
nnoremap <leader>w :w !detex \| wc -w<CR>

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype php setlocal ts=2 sw=2 sts=2
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2

" Paste contents of file when new file is created
autocmd BufNewFile  *.tex   0r $HOME/.config/nvim/skeletons/skeleton.tex
