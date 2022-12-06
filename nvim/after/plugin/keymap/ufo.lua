local nnoremap = require("restacksyj.keymap").nnoremap
local silent = { silent = true }

nnoremap("zR", function() require("ufo").openAllFolds() end, silent)
nnoremap("zM", function() require("ufo").closeAllFolds() end, silent)
nnoremap("zK", function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then vim.lsp.buf.hover() end
end, silent)
