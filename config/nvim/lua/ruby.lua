local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.solargraph.setup {
  cmd = {
    "solargraph",
    "stdio"
  },
  filetypes = {
    "ruby"
  },
  flags = {
    debounce_text_changes = 150
  },
  on_attach = lsp_attached,
  root_dir = util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
