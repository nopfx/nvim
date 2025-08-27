return {
	"sainnhe/gruvbox-material",
	priority = 10000,
	lazy = false,
	config = function()
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_background = "medium"
		vim.cmd.colorscheme("gruvbox-material")

		-- Set diagnostic virtual text colors
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934" }) -- red
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f" }) -- yellow
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#83a598" }) -- blue
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#b8bb26" }) -- green
	end,
}
