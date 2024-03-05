return {
	"HakonHarnes/img-clip.nvim",
	event = "BufEnter",
	opts = {
		default = {
			relative_to_current_file = true,
			-- add options here
			-- or leave it empty to use the default settings
		},
		filetypes = {
			vimwiki = {
				url_encode_path = true,
				template = "![$CURSOR]($FILE_PATH)",

				drag_and_drop = {
					download_images = false,
				},
			},
		},
	},
	keys = {
		-- suggested keymap
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
	},
}
