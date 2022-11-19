local _catppuccin, catppuccin = pcall(require, "catppuccin")
if not _catppuccin then
    return
end

local theme = "macchiato"

catppuccin.setup({
  flavour = theme,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = { "bold" },
    booleans = { "italic" },
    properties = {},
    types = { "bold" },
    operators = {},
  }
})

vim.cmd("colorscheme catppuccin-" .. theme)
