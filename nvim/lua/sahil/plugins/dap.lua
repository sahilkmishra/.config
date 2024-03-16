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
		init = function()
			require("noice").setup()
		end,
	},
}
