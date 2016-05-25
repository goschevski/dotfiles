call plug#begin('~/.config/nvim/plugged')

" Gui plugins
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'

" Search and movement
Plug 'mileszs/ack.vim'

" Git and command line
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Autocomplete and sinppets
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'

" Code edit
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

" Code highlight
Plug 'pangloss/vim-javascript'
Plug 'Glench/Vim-Jinja2-Syntax'

" Markdown
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Share code (gist)
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Color schemes
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'

" Add plugins to &runtimepath
call plug#end()

" ================================================
" Color scheme
" ================================================
let base16colorspace=256
set t_Co=256
execute "set background=".$BACKGROUND
execute "colorscheme base16-".$THEME

" ================================================
" General config
" ================================================
set nocompatible                " not compatible with vi
set relativenumber              "Line numbers are good
set number                      "Line numbers are good
set binary                      "don't add new line on end of file (git)
set gdefault                    "Set global flag for search and replace
set cursorline                  "Highlight current line
set cursorline cursorcolumn     "Highlight column (vertical line)
set autoread                    "Reload files changed outside vim
set smartcase                   "Smart case search if there is uppercase
set ignorecase                  "case insensitive search
set clipboard+=unnamedplus      "use system clipboard
set laststatus=2                "Show statusbar
set fileencoding=utf-8          "Set utf-8 encoding on write
set hidden                      "Switch buffers when they are not saved"
syntax on                       "Turn on syntax highlighting

" ================================================
" Indentation
" ================================================
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set autoindent

" ================================================
" Completion
" ================================================
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

" ================================================
" Swap files
" ================================================
set noswapfile
set nobackup
set nowb

" ================================================
" Functions
" ================================================
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

function! SetFileType()
    let name = input("Filetype: ")
    if (name != "")
        exec "set filetype=" . name
    endif
endfunction

" ================================================
" Auto-Commands
" ================================================
" Show nunjucks as jinja
autocmd BufNewFile,BufReadPost *.nunj set filetype=jinja
" Goyo and Limelight sync
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Run neomake on file save
autocmd! BufWritePost * Neomake

" ================================================
" Key mappings (bindings)
" ================================================
" Map leader
let mapleader = "\<Space>"

" Map leader
nnoremap <Leader><Leader>r :source ~/.config/nvim/init.vim<CR>

" Notes
nnoremap <Leader>n :e ~/Google\ Drive/Notes/

" Disable Ex mode
noremap Q <NOP>

" Copy file path
nnoremap <Leader>y :let @* = expand("%:p")<CR>

" Quickfix and location lists
map <Leader>co :copen<CR>
map <Leader>cc :cclose<CR>
map <Leader>cn :cn<CR>
map <Leader>cp :cp<CR>
map <Leader>lo :lopen<CR>
map <Leader>lc :lclose<CR>

" Easy command mode
nnoremap ; :
vnoremap ; :

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

" Substitute
nnoremap <Leader>sr :%s//g<left><left>

" Fast save
nnoremap <Leader>w :w<CR>

" Fast quit
nnoremap <Leader>q :q<CR>

" Shorthand for making window smaller and bigger
nnoremap <Leader>, <C-w>20<
nnoremap <Leader>. <C-w>20>

" Hide highlight
nnoremap <silent> <BS> :noh<CR>

" Indenting in visual and normal mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
nnoremap <tab> >>
nnoremap <s-tab> <<

" Set FileType
nnoremap <Leader>/ :call SetFileType()<CR>

" Clear trailing whitespaces
nnoremap <Leader>i :call StripTrailingWhitespaces()<CR>

" ================================================
" Plugin settings and mappings (bindings)
" ================================================

" Calendar
let g:calendar_google_calendar = 1

" Investigate
let g:investigate_use_dash=1

" NERDTree
map <Leader>r :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" CtrlP
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>
let g:ctrlp_reuse_window = 'startify'

" Ack Search
nnoremap <Leader>f :Ack<Space>
let g:ackprg = 'ag --vimgrep'

" Fugitive commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>:w<CR>

" GitGutter
let g:gitgutter_realtime = 0

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'pbcopy'
xnoremap <Leader>gist :Gist<CR>
nnoremap <Leader>gist :Gist<CR>

" Startify
let g:startify_list_order = ['dir']

" Deoplete
let g:deoplete#enable_at_startup = 1

" Neosnippet
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = '~/dotfiles/snippets'
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"
