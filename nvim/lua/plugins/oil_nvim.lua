-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/stevearc/oil.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup()
	end,
	init = function()
		vim.api.nvim_set_keymap("n", "<Leader>o", ":Oil<CR>", { noremap = true, silent = true })
	end,
}
