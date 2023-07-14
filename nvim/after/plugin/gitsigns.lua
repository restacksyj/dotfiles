require("gitsigns").setup({
	current_line_blame_opts = {
		virt_text_pos = "overlay", -- 'eol' | 'overlay' | 'right_align'
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		-- Navigation
		-- map("n", "]c", function()
		-- 	if vim.wo.diff then
		-- 		return "]c"
		-- 	end
		-- 	vim.schedule(function()
		-- 		gs.next_hunk()
		-- 	end)
		-- 	return "<Ignore>"
		-- end, { expr = true })
		--
		-- map("n", "[c", function()
		-- 	if vim.wo.diff then
		-- 		return "[c"
		-- 	end
		-- 	vim.schedule(function()
		-- 		gs.prev_hunk()
		-- 	end)
		-- 	return "<Ignore>"
		-- end, { expr = true })

		-- Actions
		vim.keymap.set("n", "<leader>tt", gs.toggle_current_line_blame, { buffer = bufnr })
		vim.keymap.set("n", "<leader>tb", gs.blame_line, { buffer = bufnr })
		vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr })
	end,
})
