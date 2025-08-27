vim.wo.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.cursorline = true

vim.o.swapfile = false

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.conceallevel = 0
vim.o.backspace = "indent,eol,start"
vim.o.showtabline = 2
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.scrolloff = 20
vim.o.completeopt = "menuone,noselect"
vim.opt.termguicolors = true

-- Map severity to symbols (single-character icons for 0.11)
local severity_icons = {
	[vim.diagnostic.severity.ERROR] = "●",
	[vim.diagnostic.severity.WARN] = "▲",
	[vim.diagnostic.severity.INFO] = "■",
	[vim.diagnostic.severity.HINT] = "◆",
}

vim.diagnostic.config({
	virtual_text = {
		spacing = 1,
		-- Prefix per diagnostic
		prefix = function(diagnostic)
			return severity_icons[diagnostic.severity] or "●"
		end,
		-- Always show diagnostic message
		format = function(diagnostic)
			return " "
		end,
	},
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
})

-- Set gutter icons
local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
	defaults = { lazy = true },

	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
}
