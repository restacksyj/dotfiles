local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
				["<CR>"] = actions.select_default,
			},
			n = {
				["q"] = actions.close,
				["cd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					vim.cmd(string.format("cd %s", dir))
				end,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			previewer = false,
		},
	},
})

require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<C-p>", function()
	builtin.find_files({
		hidden = true,
		respect_gitignore = false,
		file_ignore_patterns = {
			".git/",
			".cache",
			"node_modules/",
			-- "%.o",
			-- "%.a",
			-- "%.out",
			-- "%.class",
			-- "%.pdf",
			-- "%.mkv",
			-- "%.mp4",
			-- "%.zip",
		},
	})
end, {})
vim.keymap.set("n", "<leader>vrc", function()
	builtin.find_files({
		prompt_title = "< Dotfiles >",
		cwd = "~/.config",
		hidden = true,
	})
end, {})

vim.keymap.set("n", "<leader>fb", function()
	builtin.find_files({
		prompt_title = "< Freightbro >",
		cwd = "/Users/yashjajoo/Documents/freightbro",
		hidden = true,
		file_ignore_patterns = { "node_modules/*", "vendor" },
	})
end, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pw", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
vim.keymap.set("n", "<leader>gc", builtin.git_branches, {})
vim.keymap.set("n", "<leader>dal", "<cmd>Telescope diagnostics<CR>", {})
vim.keymap.set("n", "<leader>dl", function()
	builtin.diagnostics({ bufnr = 0 })
end, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fj", function()
	builtin.current_buffer_fuzzy_find({ height = 10, previewer = false })
end, {})

vim.keymap.set("n", "<leader>fh", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end, {})
