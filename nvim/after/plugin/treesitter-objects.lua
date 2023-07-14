require("nvim-treesitter.configs").setup({
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>px"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>pX"] = "@parameter.inner",
			},
		},
	},
})
