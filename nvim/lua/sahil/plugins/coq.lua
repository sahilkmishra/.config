return {
	--"ms-jpq/coq_nvim", optional for icon support config = function() calling `setup` is optional for customization end, init = function() vim.api.nvim_set_keymap("n", "<Leader>c", ":COQnow<CR>", { noremap = true, silent = true }) end,
}
