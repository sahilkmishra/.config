return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "biome", "prettierd", "prettier" } },
				typescript = { { "biome", "prettierd", "prettier" } },
				json = { "biome" },
				markdown = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "htmlbeautifier", "prettier" } },
				rust = { "rustfmt" },
				go = {
					"gofumpt",
					"goimports",
					"goimports-reviser",
					"golines",
					"gomodifytags",
					"gotests",
				},
				gd = { "gdtoolkit" },
				c = { "ast-grep" },
				cpp = { "ast-grep" },
				sh = { "shfmt" },
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
				-- Customize formatters
				formatters = {
					shfmt = {
						prepend_args = { "-i", "2" },
					},
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "vale", "write_good", "woke", "cspell" },
				norg = { "write_good", "woke", "cspell" },
				cpp = {
					"cpplint",
				},
				c = {
					"cpplint",
				},
				rust = {},
				lua = {},
				html = {},
				go = {
					--	"golangci-lint",
					"nilaway",
					"revive",
					"semgrep",
					"snyk",
					"staticcheck",
				},
				docker = {
					"dockerfile-language-server",
					"docker-compose-language-service",
					"sonarlint-language-server",
					"trivy",
					"snyk",
				},
				make = {
					"cmakelint",
				},

				sh = {
					"shellharden",
					"shellcheck",
				},
			}
			vim.keymap.set("n", "<Leader>L", function()
				lint.try_lint()
			end, { desc = "Lint current File" })
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",

		dependencies = { "mason.nvim", "mason-lspconfig.nvim", "nvim-lint" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = { "eslint_d", "revive", "write-good", "woke", "shellharden", "shellcheck" },
			})
		end,
	},
}
