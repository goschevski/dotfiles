vim.keymap.set('n', '<Leader><CR>', ':FloatermToggle<CR>')
vim.keymap.set('n', '<Leader><BS>', ':FloatermKill<CR>:FloatermToggle<CR>')
vim.keymap.set('t', '<Leader><BS>', '<C-\\><C-n>:FloatermKill<CR>:FloatermToggle<CR>')
vim.keymap.set('t', '<Leader><CR>', '<C-\\><C-n>:FloatermToggle<CR>')
