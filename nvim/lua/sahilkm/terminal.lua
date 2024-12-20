local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd('TermOpen', {

    group = vim.api.nvim_create_augroup('custom-term', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  })

  vim.api.nvim_create_autocmd('BufReadPre', {

    group = vim.api.nvim_create_augroup('reset-term-lineconfig', { clear = true }),
    callback = function()
      vim.opt.number = true
      vim.opt.relativenumber = true
    end,
  })
end

return M
