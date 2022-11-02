local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false
  }
})
