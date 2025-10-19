return {
  "nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",
  config = function ()
    local tconfig = require("nvim-treesitter.configs")
    tconfig.setup({
      ensure_installed = {"lua", "javascript", "haskell", "c", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}
