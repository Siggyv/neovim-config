return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    vim.keymap.set('n', '<C-t>', ':Neotree filesystem toggle<CR>', {})
    vim.keymap.set('n', '<C-n>', function ()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd("wincmd p")
      else
        require("neo-tree.command").execute({
          action = "focus",
          source = "filesystem",
          position = "left",
        })
      end
    end, { desc = "Neo-tree: focus <-> last active window" })
  end
}
