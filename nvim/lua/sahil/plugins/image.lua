return {
	"3rd/image.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({

					ensure_installed = {
						"markdown_inline",
						--		,"markdown"
					},
					highlight = { enable = true },
				})
			end,
		},
	},
	opts = {
		backend = "kitty",
		--backend = "neovide",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "md" }, -- markdown extensions (ie. quarto) can go here
			},
			neorg = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "norg" },
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		kitty_method = "normal",
	},
	config = function()
		require("image").setup({
			integrations = {
				markdown = {
					resolve_image_path = function(document_path, image_path, fallback)
						-- document_path is the path to the file that contains the image
						-- image_path is the potentially relative path to the image. for
						-- markdown it's `![](this text)`

						-- you can call the fallback function to get the default behavior
						return fallback(document_path, image_path)
					end,
				},
			},
		})
	end,
}
