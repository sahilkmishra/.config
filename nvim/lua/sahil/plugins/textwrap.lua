return {
	{
		"andrewferrier/wrapping.nvim",
		opts = {
			auto_set_mode_filetype_allowlist = {
				"asciidoc",
				"gitcommit",
				"latex",
				"mail",
				"markdown",
				"rst",
				"tex",
				"text",
			},
		},
		config = function()
			require("wrapping").setup()
		end,
	},
}
