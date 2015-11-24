" additional bundles
"   https://github.com/bling/vim-airline
"   https://github.com/hdima/python-syntax
"   https://github.com/klen/python-mode
"   https://github.com/scrooloose/syntastic
"   https://github.com/scrooloose/nerdtree
"   https://github.com/tpope/vim-pathogen
"   https://github.com/vim-scripts/Align
"   https://github.com/voithos/vim-python-matchit
"   https://github.com/altercation/vim-colors-solarized

set encoding=utf-8
"" pathogen for runtimepath plugins
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

filetype plugin indent on
syntax enable
syntax on

" remap leader
let mapleader = ","

"shortcuts for editing/reloading .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden                      "change buffers
"switch between buffers using l/r arrow keys
map <right> :bn<cr>
map <left> :bp<cr>

set nocompatible  " choose no compatibility with legacy vi
set showcmd  " display incomplete commands
set cmdheight=1 "command window height
set complete-=i
set fileformats=unix,mac,dos
set number  " show line numbers
if $TMUX == ''
  set clipboard=unnamed  " use for copy/pasting in tmux
endif

set wrap                      " don't wrap lines
set textwidth=100
set colorcolumn=100
" comment formatting (q), comment leader (r), numbered lists (n), and break
" before 1 letter word instead of after(1).
set formatoptions=qrn1

"" avoid modeline security exploits
set modelines=0

set autochdir  " auto cd to current file directory
set tabstop=4  "spaces for autoindenting
set softtabstop=4  "spaces for autoindenting
set shiftwidth=4  "spaces for autoindenting
set expandtab  " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent
set autoread  " reload files changed on disk
set copyindent
set shiftround  "use multiples for indenting with < or >
set showmatch  "show matching parenthesis

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set smarttab                   " insert tabs on line according to shiftwidth
set gdefault                   " substitute globally

"" No sound/visual on errors
set noerrorbells
set novisualbell

"" history/undo stuff
set history=10000
set undolevels=10000
set title
set nobackup
set noswapfile

"" more stuff
set scrolloff=3  " give cursor context
set wildmenu
set wildmode=longest,list,full
set ttyfast
set ruler
set laststatus=2  " show status line
set number

"" file type specific stuff
autocmd filetype python set expandtab   "make python indenting suck less

" show invisible characters
set list  " use this for making whitespace visible as a  '.'
set listchars=tab:▸\ ,trail:.,eol:¬

" avoid cascading indents
set pastetoggle=<F2>

" stripe trailing whitespace,
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" disable arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" remap keys
noremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :noh<cr>
nnoremap <tab> % " use tab instead of % for matching brackets
vnoremap <tab> %

" death to the F1 help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" autosave when switching focus
au FocusLost * :wa

" open new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" hjkl for moving around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" set default split locations
set splitbelow
set splitright

" clear highlight searches
nmap <silent> ,/ :nohlsearch<CR>

" use solarized dark colorscheme
set background=dark
let g:solarized_termtrans=1 " avoid errors with transparent terminals
colorscheme solarized

set spell spelllang=en_us

" python-syntax
let g:python_highlight_all = 1

" python-mode settings
let g:syntastic_python_checkers=['pyflakes']
let g:pymode_rope=0
let g:pymode_options_max_line_length=100

" open NERDtree
map <leader>ne :NERDTreeToggle<CR>
