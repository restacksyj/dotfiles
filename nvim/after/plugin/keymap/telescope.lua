local nnoremap = require("restacksyj.keymap").nnoremap

nnoremap("<C-p>", ":Telescope")

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').find_files({
            -- find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        })
end)

nnoremap("<Leader>fb", function()
    require('restacksyj.telescope').search_fbfiles()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>vrc", function()
    require('restacksyj.telescope').search_dotfiles()
end)

nnoremap("<leader>gc", function()
    require('restacksyj.telescope').git_branches()
end)
