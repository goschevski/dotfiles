vim.g.mapleader = " "
vim.g.maplocalleader=" "

vim.keymap.set('n', '<Leader>r', ':e!<CR>')
vim.keymap.set('n', '<Leader><leader>r', ':source ~/.config/nvim/init.lua<CR>')
vim.keymap.set('x', '<Leader>v', '"0p')
vim.keymap.set('n', '<Leader><Leader>c', 'magg:vsplit<CR>:set noscrollbind<CR><C-w>l<C-f>:set scrollbind<CR><C-w>h:set scrollbind<CR>`a')
vim.keymap.set('n', '=', ':only<CR>')

vim.keymap.set('n', '<Leader><Leader>j', ':%!python3 -m json.tool<CR>')
vim.keymap.set('v', '<Leader><Leader>j', ':!python3 -m json.tool<CR>')

vim.keymap.set('n', 'Q', '<NOP>')

vim.keymap.set('n', '<Leader>y', ':let @* = expand("%")<CR>')
vim.keymap.set('n', '<Leader>p', '^v$p')

vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', '$h')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('v', 'H', '^')

vim.keymap.set('n', '<Leader>co', ':copen<CR>')
vim.keymap.set('n', '<Leader>cc', ':cclose<CR>')
vim.keymap.set('n', '<Leader>cn', ':cn<CR>')
vim.keymap.set('n', '<Leader>cp', ':cp<CR>')
vim.keymap.set('n', '<Leader>lo', ':lopen<CR>')
vim.keymap.set('n', '<Leader>lc', ':lclose<CR>')
vim.keymap.set('n', '<Leader>ln', ':ln<CR>')
vim.keymap.set('n', '<Leader>lp', ':lp<CR>')

vim.keymap.set('v', '//', 'y/<C-R>"<CR>N')

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', '\\', '*N')
vim.keymap.set('n', '\'', '*Ncgn')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')

vim.keymap.set('n', '<Leader><Tab>', '<C-^>')

vim.keymap.set('n', '<Leader>Q', ':bufdo bdelete<CR>')
vim.keymap.set('n', '<Leader>x', ':bn<CR>:bd#<CR>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<Leader>d', 'ggdG')
vim.keymap.set('n', '<Leader><Leader>y', 'mpggVGy`p')


vim.keymap.set('n', '<Leader>j', 'o<Esc>k')
vim.keymap.set('n', '<Leader>k', 'O<Esc>j')

vim.keymap.set('n', 'gg', 'mpgg')
vim.keymap.set('n', 'G', 'mpG')
vim.keymap.set('n', '/', 'mp/')

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<Leader>sr', ':%s///<left><left><C-f>i')

vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')

vim.keymap.set('n', '<Leader>,', '<C-w>10<')
vim.keymap.set('n', '<Leader>.', '<C-w>10>')

vim.keymap.set('n', '<BS>', ':noh<CR>')

vim.keymap.set('x', '<s-tab>', '<gv')
vim.keymap.set('x', '<tab>', '>gv')
vim.keymap.set('n', '<tab>', '>>')
vim.keymap.set('n', '<s-tab>', '<<')

vim.keymap.set('n', '<Leader>1', ':e %<.vue<CR>')
vim.keymap.set('n', '<Leader>2', ':e %<.js<CR>')
vim.keymap.set('n', '<Leader>3', ':e %<.css<CR>')

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- FZF
vim.api.nvim_set_keymap('n', '<Leader>ff', ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fs', ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgl', ":Telescope git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgf', ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgb', ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgs', ":Telescope git_status<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ":Telescope filetypes<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', ":Telescope current_buffer_fuzzy_find prompt_position=top sorting_strategy=ascending<CR>", { noremap = true, silent = true })

-- Nvim Tree
vim.keymap.set('n', '+', ':NvimTreeFindFileToggle<CR>')

-- True Zen
vim.api.nvim_set_keymap('n', '<Leader>za', ":TZAtaraxis<CR>", { noremap = true, silent = true })

-- Refactoring
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Ack.vim (ripgrep)
vim.g.ackprg = 'rg -F -S --color=never --no-heading --with-filename --line-number --column -g !package-lock.json'
vim.keymap.set('n', '<leader>fr', ':Ack! "" ./<Left><Left><Left><Left>')

-- Fold search
local folded = 0
function toggle_fold ()
  if folded == 1 then
    vim.cmd('normal! zR')
    folded = 0
  else
    vim.cmd('Fs')
    folded = 1
  end
end
vim.g.foldsearch_disable_mappings = 1
vim.keymap.set('n', ',', ':lua toggle_fold()<CR>')

-- Fugitive
vim.keymap.set('n', '<Leader>gst', ':Git<CR>')
vim.keymap.set('n', '<Leader>gd', ':Gdiff<CR>')
vim.keymap.set('n', '<Leader>gf', ':Git fetch -p<CR>')
vim.keymap.set('n', '<Leader>gb', ':Git blame<CR>')
vim.keymap.set('n', '<Leader>gco', ':Gread<CR>:w<CR>')

-- Hop (easymotion)
vim.keymap.set('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.keymap.set('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.keymap.set('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.keymap.set('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.keymap.set('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.keymap.set('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.keymap.set('n', 's', "<cmd> HopWord<CR>", {})
