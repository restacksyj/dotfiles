return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("tpope/vim-fugitive")

	-- TJ created lodash of neovim
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")

	use({
		"nvim-lualine/lualine.nvim",
	})

	use("ThePrimeagen/harpoon")

	use("mbbill/undotree")

	-- Colorscheme section
	-- use("gruvbox-community/gruvbox")
	-- use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "rose-pine/neovim", as = "rose-pine" })

	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})
	--
	-- use("nvim-treesitter/playground")
	use("romgrk/nvim-treesitter-context")
	use("jose-elias-alvarez/null-ls.nvim")

	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- restacksyj starts here (different from theprimeagen)
	use({
		"numToStr/Comment.nvim",
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("ray-x/go.nvim")
	-- this is used for folding lines
	-- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("tzachar/cmp-tabnine")
	use("onsails/lspkind-nvim")
	use("folke/zen-mode.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("nvim-tree/nvim-web-devicons")
	use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })
	-- trying out these for text objects line and entire
	use("kana/vim-textobj-user")
	use("kana/vim-textobj-line")
	-- use("kana/vim-textobj-entire") -- very dangerous for me :)
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	use("rebelot/kanagawa.nvim")
	use("leoluz/nvim-dap-go")
	use("tpope/vim-abolish")
	-- use({
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	requires = {
	-- 		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	-- 	},
	-- 	tag = "nightly", -- optional, updated every week. (see issue #1193)
	-- })
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})
	use("chentoast/marks.nvim")
end)
