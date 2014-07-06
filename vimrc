set nocompatible        "Be iMproved;
scriptencoding utf-8    "Set scriptencoding to utf-8 (listchars)

" ================ Vundle ====================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'itchyny/lightline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'jiangmiao/auto-pairs'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'jeetsukumaran/vim-filesearch'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

filetype plugin indent on
" ================ End Vundle ====================

let mapleader = ","

" ================ Initial folder ====================
if !argc()
     if isdirectory("/Users/aleksandargosevski/Sites/")
        cd ~/Sites
    elseif isdirectory("/var/www")
        cd /var/www
    elseif isdirectory("c:/xampp/htdocs")
        cd c:/xampp/htdocs
    endif
endif

" If no file is selected, execute Nerdtree plugin
autocmd vimenter * if !argc() | NERDTree | endif

" ================ Some guioptions ====================
set guioptions-=m                       "remove menu bar
set guioptions-=T                       "remove toolbar
set guioptions-=L                       "remove left scrollbar when vertical split
set guioptions-=l                       "remove left scrollbar
set linespace=6                         "Set lineheight in gvim
let g:solarized_visibility="none"       "Disable specialkey highlight in solarized

" ================ General Config ====================
set t_Co=256                    "Set 256 colors
set mouse=a                     "Enable mouse
set title                       "change the terminal's title
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=500                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set noshowmode                  "Hide showmode because of the powerline plugin
set gdefault                    "Set global flag for search and replace
set gcr=a:blinkon0              "Disable cursor blink
set noerrorbells                "No error bells
set cursorline                  "Highlight current line
:hi CursorLine cterm=NONE
set visualbell                  "No sounds
set wrap                        "Enable word wrap
set autoread                    "Reload files changed outside vim
set smartcase                   "Smart case search if there is uppercase
set ignorecase                  "case insensitive search
set hlsearch                    "Highlight search term
set incsearch                   "Jump to found term while searching
set showmatch                   "Highlight matching bracket
set background=dark             "Set background to dark
set clipboard+=unnamed          "Copy to system clibpoard
set tags=tags;/                 "ctags file location, searches to root until it founds it
set listchars=tab:\ \ ,trail:·  "Set trails for tabs and spaces
set list                        "Enable listchars
set completeopt-=preview        "Disable preview for autocomplete
set hidden                      "http://items.sjbach.com/319/configuring-vim-right
syntax on                       "Turn on syntax highlighting
colorscheme Tomorrow-Night      "Color scheme
let base16colorspace=256
set laststatus=2                "Show statusbar
set fileencoding=utf-8          "Set utf-8 encoding on write
set encoding=utf-8              "Set utf-8 encoding on read
set timeoutlen=1000             " Reduce Command timeout for faster escape and O
set ttimeoutlen=200

" ================ Functions ================

" Remove trailing spaces on save
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" ================ Completion =======================

set wildmode=list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*vendor/**
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Auto commands ======================

" Auto-remove trailing spaces
autocmd BufWritePre * :call StripTrailingWhitespaces()"

" Remove unused markers for snippets
autocmd InsertLeave * NeoSnippetClearMarkers

" ================ Key mapping ========================

map <Leader>s :NERDTreeTabsToggle<CR>
map <Leader>t :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
inoremap jj <Esc>
nnoremap <Leader>f :Fsgrep /

" ================ Indentation ======================
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set autoindent

" ================ Folds ============================
set foldmethod=marker
set foldmarker={{{,}}}
set nofoldenable        "dont fold by default

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Plugins setups ========================

let g:NERDTreeChDirMode=2                           "NERDTree change directory only on root change
let NERDTreeShowHidden=1                            "Show hidden files in NERDTree

let g:user_emmet_expandabbr_key = '<c-e>'           "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                 "Change trigger jump to next for emmet

let g:gitgutter_realtime = 0                        "Disable gitgutter in realtime
let g:gitgutter_eager = 0                           "Disable gitgutter to eager load on tab or buffer switch

let NERDTreeIgnore=['\.git$', '\.sass-cache$']

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"Tell Neosnippet about the snippets folder"
let g:neosnippet#snippets_directory = '~/dotfiles/snippets'
" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }
