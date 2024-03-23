return {
	{
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup({
				-- configuration here
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								work = "~/notes/work",
								journal = "~/journal",
								resume = "~/work",
								config = "~/.config",
								AceroleGameJam = "~/AcerolaGameJam1/",
								nodeIdu = "~/Projects/nodeidu/",
								pictochat = "~/Projects/pictochat/",
								musicsharer = "~/Projects/music-sharer/",
								personalWebsite = "~/Projects/sahilmishra.github.io/",
								gohtmx = "~/Projects/gohtmx/",
								salesforce = "~/salesforce/",
							},
						},
					},
					["core.concealer"] = {},
					["core.summary"] = {},
					["external.jupyter"] = {},
					["core.integrations.telescope"] = {},
				},
			})
		end,
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	},
	{
		"nvim-neorg/neorg-telescope",

		init = function()
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>nw",
				":Telescope neorg switch_workspace<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>nh",
				":Telescope neorg search_headings<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
