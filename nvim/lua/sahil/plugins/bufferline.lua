return {
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
}
