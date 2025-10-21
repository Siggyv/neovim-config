---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local tconfig = require 'nvim-treesitter.configs'
    tconfig.setup {
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_fs = 1000 * 1024 -- 1 MB
---@diagnostic disable-next-line: undefined-field
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_fs then
            return true
          end
        end,
      },
      indent = { enable = true },
      auto_installed = true,
      sync_install = false,
    }
  end,
}
