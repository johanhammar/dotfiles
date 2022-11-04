" Vim
"
" Inspiration
"  - https://github.com/peterhellberg/dotfiles/blob/master/.vimrc
"  - https://github.com/junegunn/vim-plug
"  - https://github.com/tpope/
"  - https://github.com/neuralnine

set nocompatible " explicitly get out of vi-compatible mode
filetype off

call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible' " Sensible Vim defaults - See https://github.com/tpope/vim-sensible

" Development
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'preservim/tagbar' " Tagbar for code navigation
"Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'ziglang/zig.vim'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'ThePrimeagen/refactoring.nvim'

" Utility
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'

" File management
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Git
" Plug 'pope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Themeing

Plug 'haishanh/night-owl.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'macguirerintoul/night_owl_light.vim'
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark    " Setting dark mode

set termguicolors

let mapleader = ","

syntax on
filetype plugin indent on

set anti enc=utf-8
set guifont=Source_Code_Pro_D:h13

set number
set cursorline
set scrolloff=3

" Always show the status line
set showcmd
set laststatus=2

" Make backspace a bit more flexible
set backspace=indent,eol,start

" Turn on command line completion wild style
set wildmenu
set ruler

set shiftwidth=4
set softtabstop=4
set tabstop=4

" Tabs as spaces
set expandtab
set smarttab

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

" Turn of bell
set visualbell
set t_vb=

set nobackup
set nowb
set noswapfile

set nocursorcolumn

set modelines=3

set mouse=a

au InsertLeave * set cursorline nopaste

set guicursor=i:ver25-iCursor

" Disable Ex mode
nnoremap Q <Nop>

nmap <F8> :TagbarToggle<CR>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" GitGutter
let g:gitgutter_max_signs = 250
let g:gitgutter_map_keys = 0

highlight GitGutterAdd    guifg=#97a950 ctermfg=2
highlight GitGutterChange guifg=#f9cf75 ctermfg=3
highlight GitGutterDelete guifg=#d35738 ctermfg=1

" setting horizontal and vertical splits
set splitbelow
set splitright

" List buffers
"nmap <leader>b         :buffers<cr>
nmap <leader>b :buffers<CR>:b<Space>
"nmap <leader>bl :ls<CR>

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w>w
noremap <S-tab> <c-w>W

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-W> :bd<cr>

" Resize buffers
if bufwinnr(1)
  nmap ö <C-W><<C-W><
  nmap ä <C-W>><C-W>>
  nmap Ä <C-W>-<C-W>-
  nmap Ö <C-W>+<C-W>+
endif

" Elixir Development

autocmd FileType elixir setlocal formatprg=mix\ format\ -

" Python development

" Indendation
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" NERDTree
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>n :call NERDTreeToggleInCurDir()<CR>
nnoremap <leader>f :NERDTreeFocus<CR>
"let NERDTreeIgnore = ['tmp', 'reports', 'Godeps', '_workspace', 'gin-bin', 'deps', 'vendor', node_modules]

" Open NERDTree in the directory of the current file (or /home if no file is open)
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

let NERDTreeDirArrowExpandable = '→'
let NERDTreeDirArrowCollapsible = '↓'
let NERDTreeHighlightCursorline=1

" Automatic formatting
function! <SID>StripTrailingSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Strip trailing space for a list of extensions
autocmd BufWritePre *.c,*.ex,*.exs,*.haml,*.html,*.js,*.lua,*.markdown,*.md,*.py,*.rb,*.rs,*.scss,*.txt :call <SID>StripTrailingSpace()

" Set noeol on all new files
autocmd BufNewFile * set noeol

" Ale
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

" Ack
nmap <leader>a :Ack! 
set shellpipe=&>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = ''
let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
