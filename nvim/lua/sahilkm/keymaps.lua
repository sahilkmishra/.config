local M = {}

M.setup = function()
  -- Quick Fix
  vim.keymap.set('n', '<M-k>', '<cmd>cNext<CR>', { desc = 'Qui[c]k fix Next' })
  vim.keymap.set('n', '<M-j>', '<cmd>cprevious<CR>', { desc = 'Qui[c]k fix Previous' })

  vim.keymap.set('n', ';', '<cmd>Telescope commands<CR>', { desc = 'Search Commands' })

  -- [E]nter Rationale, this looks at other programs, not nvim
  vim.keymap.set('n', '<leader>ee', '<cmd>Oil<CR>', { desc = '[E]nter [E]xplore' })
  vim.keymap.set('n', '<leader>eg', '<cmd>Neogit<CR>', { desc = '[E]nter [G]it' })
  vim.keymap.set('n', '<leader>ed', '<cmd>DapNew<CR>', { desc = '[E]nter [D]ebug' })
  vim.keymap.set('n', '<leader>eo', '<cmd>Neorg<CR>', { desc = '[E]nter [O]rg Mode' })
  vim.keymap.set('n', '<leader>eG', function()
    vim.fn.jobstart('godot4', { detach = true })
  end, { desc = '[E]nter [G]odot' })

  vim.keymap.set('n', '<leader>ea', function()
    vim.fn.jobstart('android-studio', { detach = true })
  end, { desc = '[E]nter [A]ndroid Studio' })

  vim.keymap.set('n', '<leader>et', function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 5)
  end, { desc = '[E]nter [T]erminal' })
  vim.keymap.set('n', '<leader>eb', '<cmd>BrowserBookmarks<CR>', { desc = '[E]nter [B]ookmarks' })

  -- [S]earch

  -- [T]oggle
  -- vim.keymap.set('n', '<leader>tr', function()
  --   vim.opt.relativenumber = not vim.opt.rnu
  -- end, { desc = '[T]oggle [R]elative Line Numbers' })

  -- [B]uffer

  vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = '[B]uffer [P]revious' })
  vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })

  -- [W]indow
  -- yoinked a lot of these from helix, cant map <leader>w to <C-w> bc hints don't show up

  vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = '[W]indow [V]ertical' })
  vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = '[W]indow [S]plit Horiz' })
  vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = '[W]indow left' })
  vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = '[W]indow down' })
  vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = '[W]indow up' })
  vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = '[W]indow right' })
  vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = '[W]indow Quit [O]thers' })
  vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = '[W]indow [Q]uit buffer' })
  vim.keymap.set('n', '<leader>wH', '<cmd>WinShift left<CR>', { desc = '[W]indow Shift Left' })
  vim.keymap.set('n', '<leader>wJ', '<cmd>WinShift down<CR>', { desc = '[W]indow Shift Down' })
  vim.keymap.set('n', '<leader>wK', '<cmd>WinShift up<CR>', { desc = '[W]indow Shift Up' })
  vim.keymap.set('n', '<leader>wL', '<cmd>WinShift right<CR>', { desc = '[W]indow Shift Right' })
  vim.keymap.set('n', '<leader>wT', '<C-w>T', { desc = '[W]indow [T]ab' })
  vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = '[W]indow swap ne[x]t' })
  vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = '[W]indow next [W]indow' })
  vim.keymap.set('n', '<leader>w_', '<C-w>_', { desc = '[W]indow Max Height' })
  vim.keymap.set('n', '<leader>w|', '<C-w>|', { desc = '[W]indow Max Width' })
  vim.keymap.set('n', '<leader>w<', '<C-w><', { desc = '[W]indow Width left' })
  vim.keymap.set('n', '<leader>w>', '<C-w>>', { desc = '[W]indow width right' })
  vim.keymap.set('n', '<leader>w-', '<C-w>-', { desc = '[W]indow - height' })
  vim.keymap.set('n', '<leader>w+', '<C-w>+', { desc = '[W]indow + Height' })

  -- Tab navigation like chrome
  vim.keymap.set('n', '<C-S-H>', '<cmd>tabprevious<CR>', { desc = 'Tab Left' })
  vim.keymap.set('n', '<C-S-L>', '<cmd>tabNext<CR>', { desc = 'Tab Right' })
end

return M
