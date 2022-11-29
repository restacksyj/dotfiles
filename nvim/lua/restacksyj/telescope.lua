local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

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
                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                    vim.cmd(string.format("cd %s", dir))
                end
            }
		},
	},
})

local M = {}

function M.reload_modules()
	-- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
	-- awesome things.
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd ="~/.config",
		hidden = true,
	})
end

M.search_fbfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Freightbro >",
		cwd ="/Users/yashjajoo/Documents/freightbro",
		hidden = true,
	})
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		-- attach_mappings = function(_, map)
		-- 	map("i", "<c-d>", actions.git_delete_branch)
		-- 	map("n", "<c-d>", actions.git_delete_branch)
		-- 	return true
		-- end,
	})
end

return M
