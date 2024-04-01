return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
		"nvim-neorg/neorg",
		--run = ":Neorg sync-parsers", -- This is the important bit!
		dependencies = { { "luarocks.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
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
					["core.concealer"] = {
						config = {
							folds = true,
							icon_preset = "basic",
						},
					},
					["core.summary"] = {},
					["external.jupyter"] = {},
					["core.integrations.telescope"] = {},
				},
			})
		end,
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
