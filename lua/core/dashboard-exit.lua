local M = {}

function M.on_dashboard_exit(buf)
  vim.schedule(function()
    local ok, cmd = pcall(require, "neo-tree.command")
    if ok then
      cmd.execute({
        source = "filesystem",
        position = "left",
        action = "show",
        reveal = true,
      })
    else
      vim.cmd("Neotree filesystem reveal left")
    end
  end)
end

local leaving_dash  = false

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  callback = function(args)
    vim.b[args.buf].is_dashboard = true
  end,
  desc = 'Tag dashboard buffers',
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'WinClosed' }, {
  callback = function(args)
    if vim.b[args.buf] and vim.b[args.buf].is_dashboard then
      leaving_dash = true
    end
  end,
  desc = 'Save leaving dash',
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    if not leaving_dash then return end
    if vim.bo[args.buf].filetype == 'dashboard' then return end
    if vim.bo[args.buf].buftype ~= '' then return end

    local name = vim.api.nvim_buf_get_name(args.buf)
    if name == '' then return end
    if vim.fn.filereadable(name) == 0 then return end

    leaving_dash = false
    pcall(M.on_dashboard_exit, args.buf)
  end,
  desc = 'Fires once first file found after dashboard',
})

return M

