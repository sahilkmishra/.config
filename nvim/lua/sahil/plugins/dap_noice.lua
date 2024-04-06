return {
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"mfussenegger/nvim-dap",
		init = function()
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
			dap.adapters.go = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
			}
			dap.configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					showLog = false,
					program = "${file}",
					dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
				},
			}
			-- breakpoint icons
			vim.fn.sign_define("DapBreakpoint", {
				text = "🔴", -- nerdfonts icon here
				texthl = "DapBreakpointSymbol",
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		init = function()
			require("dapui").setup()
		end,
		config = function()
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
		end,
	},
	{
		"williamboman/mason.nvim",
		init = function()
			require("mason").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		init = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		init = function()
			require("notify").setup()
		end,
	},
	{
		"folke/noice.nvim",
		opts = {
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			popupmenu = {
				backend = "nui", -- backend to use to show regular cmdline completions
			},
			routes = {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			},
		},
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				-- When true, <Esc> will close the modal - Defaults to true
				insert_only = false,
			},
		},
	},
}
