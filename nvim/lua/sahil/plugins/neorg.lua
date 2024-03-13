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
							journal = "~/docs/vimwiki",
							AceroleGameJam = "~/AcerolaGameJam1/",
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
