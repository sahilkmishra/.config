vim.g.mapleader = " "
vim.opt.colorcolumn = "81"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"markdown_inline",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ import = "sahil.plugins" },
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = { { path = "~/docs/vimwiki", syntax = "markdown", ext = ".md" } }
		end,
	},
	{
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
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			kitty_method = "normal",
		},
	},
}, opts)

vim.cmd.colorscheme("lunaperche")
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- line numbers
vim.wo.number = true

-- DAP debugger declares

local dap = require("dap")
dap.adapters.coreclr = {
	type = "executable",
	command = "/path/to/dotnet/netcoredbg/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

local dap = require("dap")
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}

require("mason").setup()

require("dapui").setup()

-- open debug ui automatically
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup()

require("diagflow").setup()

-- Devicons
require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true,
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
	},
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	},
})

-- adds marks in column
require("marks").setup({
	-- whether to map keybinds or not. default true
	default_mappings = true,
	-- which builtin marks to show. default {}
	builtin_marks = { ".", "<", ">", "^" },
	-- whether movements cycle back to the beginning/end of buffer. default true
	cyclic = true,
	-- whether the shada file is updated after modifying uppercase marks. default false
	force_write_shada = false,
	-- how often (in ms) to redraw signs/recompute mark positions.
	-- higher values will have better performance but may cause visual lag,
	-- while lower values may cause performance penalties. default 150.
	refresh_interval = 250,
	-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
	-- marks, and bookmarks.
	-- can be either a table with all/none of the keys, or a single number, in which case
	-- the priority applies to all marks.
	-- default 10.
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	-- disables mark tracking for specific filetypes. default {}
	excluded_filetypes = {},
	-- disables mark tracking for specific buftypes. default {}
	excluded_buftypes = {},
	-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
	-- sign/virttext. Bookmarks can be used to group together positions and quickly move
	-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
	-- default virt_text is "".
	bookmark_0 = {
		sign = "⚑",
		virt_text = "hello world",
		-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
		-- defaults to false.
		annotate = false,
	},
	mappings = {},
})

-- setup scrollbar

require("scrollbar").setup()

-- breakpoint icons
vim.fn.sign_define("DapBreakpoint", {
	text = "🔴", -- nerdfonts icon here
	texthl = "DapBreakpointSymbol",
	linehl = "DapBreakpoint",
	numhl = "DapBreakpoint",
})

-- formatter
--require("conform").setup({ })
--

--require("leap").create_default_mappings()
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
