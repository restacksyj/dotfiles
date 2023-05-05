require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		hijack_netrw_behavior = "disabled",
		reveal = true,
	},
})
