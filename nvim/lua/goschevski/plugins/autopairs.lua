return {
  'windwp/nvim-autopairs',
  config = {
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false
    }
  }
}
