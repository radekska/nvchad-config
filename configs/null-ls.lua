local null_ls = require "null-ls"

local b = null_ls.builtins
local line_length = 120

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- JavaScript
  b.formatting.prettier.with { extra_args = { "--print-width", line_length, "--tab-width", 2 } },

  -- XML
  b.formatting.xmlformat,

  -- Golang
  b.formatting.djlint,
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.golines.with { extra_args = { "--max-len", line_length } },
  b.code_actions.gomodifytags,

  -- Python
  b.formatting.ruff.with { args = { "format", "--line-length", line_length, "--stdin-filename", "$FILENAME", "-" } },
  b.formatting.autoflake.with { extra_args = { "--remove-all-unused-imports", "--in-place" } },
  b.formatting.isort.with {
    extra_args = {
      "--profile",
      "black",
      "--line-length",
      line_length,
      "--project",
      "core",
      "--project",
      "services",
      "--project",
      "eup",
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
