local _builtins, telescope_builtin = pcall(require, 'telescope.builtin')
if not _builtins then
  return
end

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

function Notes()
  telescope_builtin.find_files({
    prompt_title = "Notes",
    shorten_path = true,
    cwd = "~/My Drive/Notes/",
    search_dirs = { "~/My Drive/Notes/" }
  })
end

function file_exists (name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
