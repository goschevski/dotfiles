local _impatient, impatient = pcall(require, "impatient")
if _impatient then
    impatient.enable_profile()
end

require "settings"
require "plugins"
require "mappings"

-- plugins settings
require "plugins/lsp"
require "plugins/telescope"
require "plugins/cmp"
require "plugins/blankline"
require "plugins/treesitter"
require "plugins/tmux"
require "plugins/vimwiki"
require "plugins/floaterm"
require "plugins/truezen"
