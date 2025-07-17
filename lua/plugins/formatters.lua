return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
				async = false,
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				javascriptreact = { "prettier" },
				rust = { "rustfmt" },
				go = { "gofumpt", "goimports" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
		})
	end,
}
