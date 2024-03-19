-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/ghillb/cybu.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
	{
		"ghillb/cybu.nvim",
		init = function()
			require("cybu").setup({})
		end,
	},
}

