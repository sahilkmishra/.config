return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {},
	init = function()
		-- local hop = require('hop')
		require("lspconfig").rust_analyzer.setup({})

		-- open file_browser with the path of the current buffer
		vim.api.nvim_set_keymap(
			"n",
			"<space>fb",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ noremap = true }
		)

		-- Add an autocommand to run CHADopen on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			callback = function()
				vim.cmd("CHADopen")
				vim.cmd("COQnow")
			end,
		})

		-- double space for hop
		vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":HopWord<CR>", { noremap = true, silent = true })
	end,
}
