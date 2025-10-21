return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  opts = {
    options = {
      module_default = true,
      modules = {
        neotree = true,
      },
    },
  },
  priority = 1000,
  config = function ()
    vim.cmd("colorscheme nightfox")
  end
}
