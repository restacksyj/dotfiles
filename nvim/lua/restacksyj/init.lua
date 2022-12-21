require("restacksyj.packer")
require("restacksyj.set")
require("restacksyj.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
local go_group = augroup("go_group", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd("BufWritePre", {
	group = go_group,
	pattern = "*.go",
	callback = function()
		require("go.format").gofmt()
	end,
})

autocmd("BufWritePre", {
	group = go_group,
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
})

vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
