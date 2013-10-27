syntax on
set nocompatible
set mouse=a
set showmatch
set hlsearch
set ignorecase
set history=700
set incsearch
set smartcase
set autoindent
set wildmenu
set ruler
set smartindent
set backspace=2
set tabstop=4
set number
set smarttab
set shiftwidth=4
set foldmethod=manual
set cursorline
:hi CursorLine cterm=NONE ctermbg=Black ctermfg=white
let &t_Co=256
set background=dark
colorscheme tomorrow-night
set laststatus=2
execute pathogen#infect()
filetype plugin indent on
