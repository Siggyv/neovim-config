return {
  {
    'mason-org/mason.nvim',
    opts = {},
    config = function()
      require('mason').setup()
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls' },
    },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },

    config = function()
      require('mason-lspconfig').setup { ensure_installed = { 'lua_ls' }, automatic_enable = true }

      -- add cmp_nvim_lsp capabilities to lua_ls
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      local cfg = require 'lsp.lua_ls'
      cfg.capabilities = capabilities

      vim.lsp.config('lua_ls', cfg)
      vim.lsp.enable 'lua_ls'
    end,
  },
  {
    'neovim/nvim-lspconfig',
  },
}
