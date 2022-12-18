local silent = { silent = true }

vim.keymap.set("n", "zR", function()
	require("ufo").openAllFolds()
end, silent)
vim.keymap.set("n", "zM", function()
	require("ufo").closeAllFolds()
end, silent)
vim.keymap.set("n", "zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, silent)
