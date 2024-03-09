-- latex.lua
local M = {}

function M.run_latexmk()
    local tex_file = vim.fn.expand('%:p') -- current file
    local tex_cmd = 'latexmk -pdf -interaction=nonstopmode -cd ' .. tex_file
    local s:job = vim.fn.jobstart(['/bin/sh', '-c', tex_cmd], {on_exit = function() vim.cmd('redraw!') end})
end

return M

