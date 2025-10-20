return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  on_attach = function(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc=desc })
    end

    map('n', 'K',  vim.lsp.buf.hover, 'LSP: Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'LSP: Definition')
    map({ 'n','v' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code action')
    map('n', '<leader>vrn', vim.lsp.buf.rename, 'LSP: Rename')
  end,
}
