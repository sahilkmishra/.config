-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/L3MON4D3/LuaSnip
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {

	-- Installation
	{ "L3MON4D3/LuaSnip" },
	{ "ms-jpq/coq.artifacts" },
	{ "ms-jpq/coq.thirdparty" },
	{

		"ms-jpq/coq_nvim",
		config = function()
			vim.g.coq_settings = {
				keymap = {
					jump_to_mark = "", -- no jump_to_mark mapping
				},
				clients = {
					snippets = { enabled = false }, -- disable coq snippets
				},
			}
		end,
		init = function()
			vim.api.nvim_set_keymap("n", "<Leader>c", ":COQnow<CR>", { noremap = true, silent = true })
		end,
	},

	{ "mendes-davi/coq_luasnip" },
}
