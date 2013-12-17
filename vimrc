set nocompatible        "Be iMproved;
scriptencoding utf-8    "Set scriptencoding to utf-8 (listchars)

" ================ Vundle ====================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'

filetype plugin indent on
" ================ End Vundle ====================

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
set linespace=2                         "Set lineheight in gvim
let g:solarized_visibility="none"       "Disable specialkey highlight in solarized

" ================ General Config ====================
set t_Co=256                    "Set 256 colors
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
set visualbell                  "No sounds
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
colorscheme tomorrow-night      "Color scheme

" ================ Plugins setups ========================
let g:NERDTreeChDirMode=2                           "NERDTree change directory only on root change
let NERDTreeShowHidden=1                            "Show hidden files in NERDTree

" ================ Key mapping ========================
map <C-n> :NERDTreeToggle<CR>