return {
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		opts = {},
		init = function()
			require("diagflow").setup()
		end,
	},
}
