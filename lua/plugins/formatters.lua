return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Treat .htnl as html
		vim.filetype.add({
			extension = {
				htnl = "html",
			},
		})

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
				async = false,
			},
			formatters_by_ft = {
				javascript = { "prettier_js" },
				typescript = { "prettier_js" },
				css = { "prettier_css" },
				html = { "prettier_htnl", "prettier" }, -- try htnl-aware first
				json = { "prettier_js" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				javascriptreact = { "prettier_js" },
				rust = { "rustfmt" },
				go = { "gofumpt", "goimports" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			formatters = {
				prettier_htnl = {
					command = "prettier",
					args = function(ctx)
						local fname = ctx.filename or "stdin.html"
						local base_args = {
							"--stdin-filepath",
							fname,
							"--tab-width",
							"4",
							"--use-tabs",
							"false",
						}
						if fname:match("%.htnl$") then
							table.insert(base_args, "--parser")
							table.insert(base_args, "html")
						end
						return base_args
					end,
					stdin = true,
				},
				prettier_css = {
					command = "prettier",
					args = { "--stdin-filepath", "stdin.css", "--tab-width", "4", "--use-tabs", "false" },
					stdin = true,
				},
				prettier_js = {
					command = "prettier",
					args = { "--stdin-filepath", "stdin.js", "--tab-width", "4", "--use-tabs", "false" },
					stdin = true,
				},
			},
		})
	end,
}
