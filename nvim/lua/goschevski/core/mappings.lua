vim.g.mapleader = " "
vim.g.maplocalleader=" "

local keymap = vim.keymap

keymap.set('n', '<leader><leader>r', ':lua ReloadConfig()<CR>')
keymap.set('x', '<Leader>v', '"0p')
keymap.set('n', '<Leader><Leader>c', 'magg:vsplit<CR>:set noscrollbind<CR><C-w>l<C-f>:set scrollbind<CR><C-w>h:set scrollbind<CR>`a')
keymap.set('n', '=', ':only<CR>')

keymap.set('n', '<Leader><Leader>j', ':%!python3 -m json.tool<CR>')
keymap.set('v', '<Leader><Leader>j', ':!python3 -m json.tool<CR>')

keymap.set('n', 'Q', '<NOP>')

keymap.set('n', '<Leader>y', ':let @* = expand("%")<CR>')
keymap.set('n', '<Leader>p', '^v$p')

keymap.set('n', 'Y', 'y$')
keymap.set('n', 'L', '$')
keymap.set('v', 'L', '$h')
keymap.set('n', 'H', '^')
keymap.set('v', 'H', '^')

keymap.set('n', '<Leader>co', ':copen<CR>')
keymap.set('n', '<Leader>cc', ':cclose<CR>')
keymap.set('n', '<Leader>cn', ':cn<CR>')
keymap.set('n', '<Leader>cp', ':cp<CR>')
keymap.set('n', '<Leader>lo', ':lopen<CR>')
keymap.set('n', '<Leader>lc', ':lclose<CR>')
keymap.set('n', '<Leader>ln', ':ln<CR>')
keymap.set('n', '<Leader>lp', ':lp<CR>')

keymap.set('v', '//', 'y/<C-R>"<CR>N')

keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

keymap.set('n', '\\', '*N')
keymap.set('n', '\'', '*Ncgn')
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

keymap.set('n', ';', ':')
keymap.set('v', ';', ':')

keymap.set('n', '<Leader><Tab>', '<C-^>')

keymap.set('n', '<Leader>Q', ':bufdo bdelete<CR>')
keymap.set('n', '<Leader>x', ':bn<CR>:bd#<CR>')

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

keymap.set('n', '<Leader>d', 'ggdG')
keymap.set('n', '<Leader><Leader>y', 'mpggVGy`p')


keymap.set('n', '<Leader>j', 'o<Esc>k')
keymap.set('n', '<Leader>k', 'O<Esc>j')

keymap.set('n', 'gg', 'mpgg')
keymap.set('n', 'G', 'mpG')
keymap.set('n', '/', 'mp/')

keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'jk', '<Esc>')

keymap.set('n', '<Leader>sr', ':%s///<left><left><C-f>i')

keymap.set('n', '<Leader>w', ':w<CR>')
keymap.set('n', '<Leader>q', ':q<CR>')

keymap.set('n', '<Leader>,', '<C-w>10<')
keymap.set('n', '<Leader>.', '<C-w>10>')

keymap.set('n', '<BS>', ':noh<CR>')

keymap.set('x', '<s-tab>', '<gv')
keymap.set('x', '<tab>', '>gv')
keymap.set('n', '<tab>', '>>')
keymap.set('n', '<s-tab>', '<<')

keymap.set('n', '<Leader>1', ':e %<.vue<CR>')
keymap.set('n', '<Leader>2', ':e %<.js<CR>')
keymap.set('n', '<Leader>3', ':e %<.css<CR>')

keymap.set('x', 'il', 'g_o^')
keymap.set('o', 'il', ':normal vil<CR>')
keymap.set('x', 'al', '$o^')
keymap.set('o', 'al', ':normal val<CR>')

-- Notes
keymap.set('n', '<leader>nn', ':lua Todos()<CR>')
keymap.set('n', '<leader>nl', ':lua Notes()<CR>')

-- NvimTree
keymap.set('n', '<Leader>e', ':NvimTreeFindFileToggle<CR>')

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fs', ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fa', ":Telescope grep_string<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fo', ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgl', ":Telescope git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgf', ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgb', ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgs', ":Telescope git_status<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ":Telescope filetypes<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', ":Telescope colorscheme<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', ":Telescope current_buffer_fuzzy_find prompt_position=top sorting_strategy=ascending<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", { noremap = true, silent = true })

-- Hop (easymotion)
keymap.set('n', 's', "<cmd> HopWord<CR>", {})

-- Git
keymap.set('n', '<Leader>gst', ':Git<CR>')
keymap.set('n', '<Leader>gdo', ':DiffviewOpen<CR>')
keymap.set('n', '<Leader>gdc', ':DiffviewClose<CR>')
keymap.set('n', '<Leader>gb', ':Git blame<CR>')
keymap.set('n', '<Leader>gco', ':Gread<CR>:w<CR>')
keymap.set('n', ']c', ':Gitsigns next_hunk<CR>')
keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>')

-- ack
keymap.set('n', '<leader>fr', ':Ack! "" ./<Left><Left><Left><Left>')

-- fold search
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
keymap.set('n', ',', ':lua toggle_fold()<CR>')

