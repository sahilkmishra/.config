return {
	--{ "coffebar/neovim-project", opts = { projects = { -- define project roots "~/projects/*", "~/journal/", "~/work/", "~/.config/", "~/obsidian vault/Projects/Programming/*", }, }, init = function() enable saving the state of plugins in the session
	--save global and session data state
	--vim.opt.sessionoptions:append("globals")
	-- save global variables that start with an uppercase letter and contain at least one lowercase letter. end, dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim", tag = "0.1.4" }, { "Shatur/neovim-session-manager" }, }, lazy = false, priority = 100, },
}