function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^goschevski') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function Todos()
  local todos = '/Users/gosevski/My Drive/Notes/index.todo'
  if vim.fn.expand('%') == todos then
    vim.cmd('bdelete')
  else
    vim.cmd('e' .. todos)
  end
end
