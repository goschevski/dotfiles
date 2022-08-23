vim.opt.relativenumber = true                                             -- Line numbers are good
vim.opt.number = true                                                     -- Line numbers are good
vim.opt.gdefault = true                                                   -- Set global flag for search and replace
-- vim.opt.cursorline = true                                                 -- Highlight row
vim.opt.autoread = true                                                   -- Reload files changed outside vim
vim.opt.smartcase = true                                                  -- Smart case search if there is uppercase
vim.opt.ignorecase = true                                                 -- case insensitive search
vim.opt.incsearch = true                                                  -- show matches in real time
vim.opt.clipboard = 'unnamed'                                             -- use system clipboard
vim.opt.fileencoding = 'utf-8'                                            -- Set utf-8 encoding on write
vim.opt.laststatus = 3                                                    -- Status line
vim.opt.hidden = true                                                     -- Switch buffers when they are not saved
vim.opt.mouse = 'a'                                                       -- enable mouse
vim.opt.lazyredraw = true                                                 -- lazy redraw for macors
vim.opt.timeoutlen = 1000                                                 -- Fast escape
vim.opt.ttimeoutlen = 0                                                   -- Fast escape
vim.opt.foldcolumn = '0'                                                  -- Hide fold column
vim.opt.diffopt:append('vertical')                                        -- Vertical diff
vim.opt.swapfile = false                                                  -- No swap files
-- vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.cursorcolumn = true                                               -- Highlight cursor column
-- vim.opt.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·'   -- Chars instead of blanks
-- vim.opt.list = true                                                       -- Chars instead of blanks

-- Tabs
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Colors
vim.cmd('colorscheme base16-' .. os.getenv('THEME'))
vim.cmd('highlight clear FoldColumn ')                        -- Use same color for padding as background
vim.cmd('highlight LineNr ctermfg=19 guibg=NONE')           -- Change color of line numbers
vim.cmd('highlight CursorLineNr ctermfg=20 ctermbg=19')       -- Change color of line numbers
-- vim.cmd('highlight CursorLine ctermbg=18')                    -- Current line on
-- vim.cmd('highlight CursorColumn ctermbg=18')                  -- Current line on
vim.cmd('highlight CursorLine ctermbg=NONE')								  -- Current line highlight off
vim.cmd('highlight VertSplit ctermbg=NONE ctermfg=NONE')      -- Remove border background
vim.cmd('highlight EndOfBuffer ctermfg=NONE ctermbg=NONE')    -- Color of ~ at end of the file
vim.cmd('highlight SignColumn ctermbg=NONE')                  -- Color of sign column (linter)
vim.cmd('highlight Comment cterm=italic')
vim.cmd('highlight Keyword cterm=italic')
vim.cmd('highlight Special cterm=italic')
vim.cmd('highlight Statement cterm=italic')
vim.cmd('highlight Exception cterm=italic')
vim.cmd('highlight Function cterm=italic')
vim.cmd('hi clear CursorLineNR')
vim.cmd('hi! EndOfBuffer ctermbg=black ctermfg=black')
-- vim.cmd('hi clear CursorLine')
-- Material-palenight overrides
vim.cmd('highlight LineNr guifg=#32374d')           -- Change color of line numbers
vim.cmd('highlight CursorLineNR guifg=#949dca')     -- Change color of current line number
vim.cmd('se cursorline')     -- Change color of current line number
vim.cmd('hi clear CursorLine')
vim.cmd('hi VertSplit guifg=#242837')
vim.cmd('hi NvimTreeNormal guibg=#242837')
vim.cmd('hi NvimTreeVertSplit guifg=#242837 guibg=#242837')

-- Completion
vim.opt.wildignore = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*.meteor*',
  '*vim/backups*',
  '*sass-cache*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  '*node_modules*',
  '**/node_modules/**',
  '*DS_Store*',
  '*.gem',
  'log/**',
  'tmp/**',
}

vim.g.vsnip_snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ':p:h') .. '/snippets'
