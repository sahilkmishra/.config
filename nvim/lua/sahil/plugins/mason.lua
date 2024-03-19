return {
	"williamboman/mason.nvim",
	{
		"williamboman/mason-lspconfig.nvim",
		init = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			-- After setting up mason-lspconfig you may set up servers via lspconfig
			-- require("lspconfig").lua_ls.setup {}
			-- require("lspconfig").rust_analyzer.setup {}
			-- ...
		end,
	},
	"neovim/nvim-lspconfig",
}
