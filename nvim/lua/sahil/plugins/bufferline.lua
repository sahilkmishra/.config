return {
	{
		"akinsho/bufferline.nvim",
		options = {
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
		init = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("lualine").setup({
				sections = {
					lualine_y = { "progress", "filesize" },
					lualine_a = { "mode", "g:coc_status", "bo:filetype" },
				},
			})
		end,
	},
}
