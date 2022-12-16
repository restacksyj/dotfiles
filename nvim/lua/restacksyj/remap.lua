local Remap = require("restacksyj.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- moving lines up and down in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
xnoremap("<leader>p", '"_dP')
-- this works for me above doesn't
vnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("H", "^")
nnoremap("L", "$")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- while scrolling zz to middle the screen
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- when you use J in normal mode it joins the next line adds 2 spaces and keeps the cursor at the
-- same positon
nnoremap("J", "mzJ`z")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

inoremap("<C-c>", "<Esc>")

-- nnoremap("<leader>f","mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F")
nnoremap("<leader>ff", ":lua vim.lsp.buf.format(nil, 1000)<CR>")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
