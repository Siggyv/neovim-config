--local util = require("lspconfig.util")

local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Essentials
  map('n', 'gd', vim.lsp.buf.definition, "LSP: Go to definition")
  map('n', 'gr', vim.lsp.buf.references, "LSP: Show references")
  map('n', 'K', vim.lsp.buf.hover, "LSP: Hover")
  map('n', '<leader>rn', vim.lsp.buf.rename, "LSP: Rename")
  map({'n', 'v'} , '<leader>ca', vim.lsp.buf.code_action, "LSP: Code Actions")

  -- Diagnostics
  map('n', '<leader>e', vim.diagnostic.open_float, "LSP: Line Diagnostics")
  map('n', 'gK', function ()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
  end, 'LSP: Toggle Floating Diagnostics' )


end

return {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
  --root_dir = function(fname)
    --return util.root_pattern(".git", ".luarc.json", ".stylua.toml", ".editorconfig")(fname) or util.path.dirname(fname) or vim.loop.cwd()
  --end,
}
