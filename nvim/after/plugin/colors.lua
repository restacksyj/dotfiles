require("rose-pine").setup({
	disable_background = true,
})
vim.g.restacksyj_colorscheme = "rose-pine"

-- function ColorMyPencils()
-- 	vim.g.gruvbox_contrast_dark = "hard"
-- 	vim.g.tokyonight_transparent_sidebar = true
-- 	vim.g.tokyonight_transparent = true
-- 	vim.g.gruvbox_invert_selection = "0"
-- 	vim.opt.background = "dark"
--
-- 	vim.cmd("colorscheme " .. vim.g.restacksyj_colorscheme)
--
-- 	local hl = function(thing, opts)
-- 		vim.api.nvim_set_hl(0, thing, opts)
-- 	end
--
-- 	hl("SignColumn", {
-- 		bg = "none",
-- 	})
--
-- 	hl("ColorColumn", {
-- 		ctermbg = 0,
-- 		bg = "#2B79A0",
-- 	})
--
-- 	hl("CursorLineNR", {
-- 		bg = "None",
-- 	})
--
-- 	hl("Normal", {
-- 		bg = "none",
-- 	})
--
-- 	hl("LineNr", {
-- 		fg = "#5eacd3",
-- 	})
--
-- 	hl("netrwDir", {
-- 		fg = "#5eacd3",
-- 	})
-- end

function ColorMyPencils(color)
	color = color or "rose-pine"
	-- require("kanagawa").setup({
	-- 	transparent = true,
	-- })
	vim.cmd.colorscheme(color)
	-- vim.cmd("colorscheme kanagawa")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
