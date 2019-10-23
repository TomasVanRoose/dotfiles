" ========== Plugins ==========
call plug#begin()

" Colorscheme
Plug 'arcticicestudio/nord-vim'

" Syntactic highlighting
Plug 'w0rp/ale'

" Autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/jsonc.vim'

" Rust
if executable('rustc')
  Plug 'rust-lang/rust.vim'
endif

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy find
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" LaTeX
Plug 'lervag/vimtex'

" Rails
Plug 'tpope/vim-rails'

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

set undofile
set undodir=~/.local/share/nvim/undo

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

" ======== Plugin config =========
" Ale
let g:ale_completion_enabled = 0
let g:ale_linters = {
\   'python': ['pylint'],
\   'rust': ['rls'],
\}

let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" Rust
let g:rustfmt_autosave = 1

" Coc
" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <enter> to confirm complete
noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Expand snippets
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Fuzzy find
set rtp+=/usr/local/opt/fzf

" <leader> + f -> open fuzzy find
nnoremap <leader>f :FZF<CR>
" <leader> + e -> open in this buffer
nnoremap <leader>e :call fzf#run({'sink': 'e', 'down': '30%'})<CR>
" <leader> + sp -> split horizontally
nnoremap <leader>sp :call fzf#run({'sink': 'split', 'down': '30%'})<CR>
" <leader> + vs -> split vertically
nnoremap <leader>vs :call fzf#run({'sink': 'vsplit', 'down': '30%'})<CR>

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
