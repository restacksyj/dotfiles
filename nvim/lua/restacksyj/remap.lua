vim.g.mapleader = " "
vim.g.maplocalleader = ";"
-- vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

-- moving lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("x", "<leader>p", [["_dP]])
-- this works for me above doesn't
-- vim.keymap.set("v", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- while scrolling zz to middle the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when you use J in normal mode it joins the next line adds 2 spaces and keeps the cursor at the
-- same positon
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-y>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-d>", "<C-O>D")

-- vim.keymap.set("n","<leader>f","mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F")
vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format(nil, 2000)<CR>")

vim.keymap.set("n", "<leader>nid", ":IndentBlanklineToggle!<CR>", { silent = true })
vim.keymap.set("n", "<leader>ye", "<cmd>%y+<CR>")
vim.keymap.set("n", "<leader>fp", "<cmd>echo expand('%:p')<CR>")
vim.keymap.set("n", "<leader>yfp", "<cmd>let @+ = @% | echo 'Copied filepath'<CR>")
vim.keymap.set("n", "\\", ":Neotree reveal toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>m", require("treesj").toggle)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>neo", "<cmd>Neorg index<CR>")
vim.keymap.set("n", "<leader>ner", "<cmd>Neorg return<CR>")
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })

-- local function stay_star()
-- 	local sview = vim.fn.winsaveview()
-- 	local args = string.format("keepjumps keeppatterns execute %q", "sil normal! *")
-- 	vim.api.nvim_command(args)
-- 	vim.fn.winrestview(sview)
-- end
-- vim.keymap.set("n", "*", stay_star, { noremap = true, silent = true })
