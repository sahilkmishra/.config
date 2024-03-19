return {
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
			},
		})
	end,
}
