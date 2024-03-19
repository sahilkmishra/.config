return {
	"kkharji/sqlite.lua",
	"nvim-lua/plenary.nvim",
	{
		"vidocqh/data-viewer.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua", -- Optional, sqlite support
		},
	},
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
		cmd = {
			"RainbowDelim",
			"RainbowDelimSimple",
			"RainbowDelimQuoted",
			"RainbowMultiDelim",
		},
	},
}
