local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 40,
        height = 30,
        row = 1,
        col = 30,
      },
    },
  }
})
