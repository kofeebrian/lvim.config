-- Formatters
--------------------------------------------------------------
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua",    filetypes = { "lua" } },
  -- { command = "yapf", filetypes = { "python" } },
  -- { command = "isort", extra_args = { "--profile", "google" }, filetypes = { "python" } },
  { command = "black",     filetypes = { "python" } },
  { command = "isort",     extra_args = { "--profile", "black" },                                           filetypes = { "python" } },
  { command = "prettierd", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
  { command = "prettierd", filetypes = { "css", "scss" } },
})
