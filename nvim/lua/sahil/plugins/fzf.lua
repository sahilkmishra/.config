return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
		init = function()
			vim.api.nvim_set_keymap("n", ";", ":FzfLua commands<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fa", ":FzfLua blines<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fj", ":FzfLua lines<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fm", ":FzfLua marks<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fd", ":FzfLua buffers<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fo", ":FzfLua oldfiles<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>ft", ":FzfLua tabs<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fh", ":FzfLua help_tags<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>fr", ":FzfLua resume<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua builtin<CR>", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>w", "<C-w>", { noremap = false, silent = true })
		end,
	},
}
