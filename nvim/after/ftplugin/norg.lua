vim.api.nvim_set_keymap('i', '<M-C-d>', '<Plug>(neorg.promo.demote)', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-C-t>', '<Plug>(neorg.promo.promote)', { noremap = true })

local set = vim.opt_local

-- TODO: unset line numbers

vim.wo.wrap = false
