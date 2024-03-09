return {
	"stevearc/overseer.nvim",
	opts = {},
	init = function()
		require("overseer").setup()

		vim.api.nvim_set_keymap("n", "<Leader>o", ":OverseerOpen<CR>", { noremap = true, silent = true })
	end,
}
