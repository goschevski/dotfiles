set nocompatible        "Be iMproved;
scriptencoding utf-8    "Set scriptencoding to utf-8 (listchars)

" ================ Vundle ====================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Gui plugins
Bundle 'scrooloose/nerdtree'
Bundle 'mhinz/vim-startify'
Bundle 'kien/ctrlp.vim'
Bundle 'szw/vim-ctrlspace'
Bundle 'bling/vim-airline'

" Search and movement
Bundle 'jeetsukumaran/vim-filesearch'
Bundle 'Lokaltog/vim-easymotion'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" Autocomplete and sinppets
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

" Code edit
Bundle 'mattn/emmet-vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'

" Syntax highlight
Bundle 'jelera/vim-javascript-syntax'
Bundle 'cakebaker/scss-syntax.vim'

" Share code (gist)
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Color schemes
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

filetype plugin indent on

" ================ GUI options ====================
set guioptions-=m                           "remove menu bar
set guioptions-=T                           "remove toolbar
set guioptions-=L                           "remove left scrollbar when vertical split
set guioptions-=l                           "remove left scrollbar
set linespace=10                            "Set lineheight in gvim

" ================ General Config ====================
set showtabline=0               "Hide tabs
set mouse=a                     "Enable mouse
set title                       "change the terminal's title
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=500                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gdefault                    "Set global flag for search and replace
set gcr=a:blinkon0              "Disable cursor blink
set noerrorbells                "No error bells
set cursorline                  "Highlight current line
set visualbell                  "No sounds
set wrap                        "Enable word wrap
set autoread                    "Reload files changed outside vim
set smartcase                   "Smart case search if there is uppercase
set ignorecase                  "case insensitive search
set hlsearch                    "Highlight search term
set incsearch                   "Jump to found term while searching
set showmatch                   "Highlight matching bracket
set clipboard+=unnamed          "Copy to system clibpoard
set tags=tags;/                 "ctags file location, searches to root until it founds it
set listchars=tab:\ \ ,trail:·  "Set trails for tabs and spaces
set list                        "Enable listchars
set completeopt-=preview        "Disable preview for autocomplete
set hidden                      "http://items.sjbach.com/319/configuring-vim-right
syntax on                       "Turn on syntax highlighting
set laststatus=2                "Show statusbar
set fileencoding=utf-8          "Set utf-8 encoding on write
set encoding=utf-8              "Set utf-8 encoding on read
set timeoutlen=1000             " Reduce Command timeout for faster escape and O
set ttimeoutlen=200

" =============== Color Schemes ====================
set t_Co=256
set background=dark
" let g:molokai_original = 1
" colorscheme molokai
" colorscheme tomorrow-night
colorscheme solarized

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
set nofoldenable

" ================ Scrolling ========================
set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" ================ Completion =======================

set wildmode=list:full
set wildmenu
set wildignore=*.o,*.obj,*~
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

" ================ Functions ================

" Remove trailing spaces on save
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

function! ExtractLocalVariable()
    let name = input("Variable name: ")

    if (visualmode() == "")
        normal! viw
    else
        normal! gv
    endif

    exec "normal! c" . name
    exec "normal! Ovar " . name . " = "
    exec "normal! pa;"
endfunction

" ================ Auto commands ======================

" Auto-remove trailing spaces
autocmd BufWritePre * :call StripTrailingWhitespaces()"

" Startify CtrlP NERDTree Sync
autocmd FileType startify setlocal buftype=
autocmd VimEnter * if !argc() | Startify | NERDTree | execute "normal \<c-w>w" | endif

" Remove unused markers for snippets
autocmd InsertLeave * NeoSnippetClearMarkers

" ================ Key mapping ========================

" Map leader
let mapleader = "\<Space>"

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Switch window quickly
map <Leader><Tab> <C-w>w

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Delete content of the file
nnoremap <Leader>d ggdG

" Add empty line and stay in command mode
nmap <Leader>j o<Esc>
nmap <Leader>k O<Esc>

" Fast exit to normal mode
inoremap jj <Esc>
inoremap jk <Esc>

" Fast save
nnoremap <Leader>w :w<CR>

" Fast quit
nnoremap <Leader>q :q<CR>

" Shorthand for making window smaller and bigger
nnoremap <Leader>, <C-w>20<
nnoremap <Leader>. <C-w>20>

" Copy and paste
vnoremap <Leader>y "+y"
nnoremap <Leader>p <Esc>"+p
nnoremap <Leader>op o<Esc>p

" Hide highlight
nnoremap <Leader>h :noh<CR>

" Indenting in visual and normal mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
nnoremap <tab> >>
nnoremap <s-tab> <<

" Run npm test
nnoremap <Leader>t :!npm test<CR>

" Extract variable
vnoremap <Leader>var :call ExtractLocalVariable()<CR>

" ================ Plugins setups ========================

" Startify
let g:startify_custom_header = [
\ '       ____                _                    _    _ ',
\ '      / ___| ___  ___  ___| |__   _____   _____| | _(_)',
\ '     | |  _ / _ \/ __|/ __|  _ \ / _ \ \ / / __| |/ / |',
\ '     | |_| | (_) \__ \ (__| | | |  __/\ V /\__ \   <| |',
\ '      \____|\___/|___/\___|_| |_|\___| \_/ |___/_|\_\_|',
\ '',
\ ''
\ ]
let g:startify_relative_path = 1
let g:startify_list_order = ['dir']
let g:startify_list_order = [['    My last recently modified files in the current directory:'], 'dir']

" NERDTree
map <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.sass-cache$']
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1

" Fugitive commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>

" CtrlP
map <Leader>r :CtrlPBufTag<CR>
let g:ctrlp_buffer_func = { 'enter': 'HideStatusLine', 'exit':  'ShowStatusLine' }
func! HideStatusLine()
    set laststatus=0
endfunc
func! ShowStatusLine()
    set laststatus=2
endfunc
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_buftag_types = {
      \ 'javascript' : {
          \ 'bin': 'jsctags',
          \ 'args': '-f -',
    \ },
    \ }

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
nnoremap <Leader>c :SyntasticCheck<CR>
nnoremap <Leader>x :lclose<CR>

" Commentary
nmap <Leader>\ gcc

" File Search
nnoremap <Leader>f :Fsgrep /

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'           "Change trigger emmet key
let g:user_emmet_next_key = '<C-n>'                 "Change trigger jump to next for emmet

" GitGutter
let g:gitgutter_realtime = 0                        "Disable gitgutter in realtime
let g:gitgutter_eager = 0                           "Disable gitgutter to eager load on tab or buffer switch

" NeoSnippet
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neosnippet#snippets_directory = '~/dotfiles/snippets'
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'pbcopy'
xnoremap <Leader>gist :Gist -a<CR>
nnoremap <Leader>gist :Gist -a<CR>
nnoremap <Leader>agist :Gist -a -m<CR>

let g:airline_powerline_fonts = 1                           "Enable powerline fonts
let g:airline_theme = "powerlineish"                        "Set theme to powerline default theme
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                       "set encoding type info
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'    "Set relative path
let g:airline_section_c = '%<%f %#__accent_red#%m%#__restore__# %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#' "Adds red modified
let g:airline#extensions#whitespace#enabled = 0             "Disable whitespace extension"'"))}'"'")}'"
