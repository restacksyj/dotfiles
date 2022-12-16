local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
-- local lspconfig = require("lspconfig")
lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings,
	--    sources = {
	--        { name = "lsp" },
	-- 	{ name = "cmp_tabnine" },
	-- 	{ name = "luasnip" },
	-- 	{ name = "buffer" },
	-- },
	--    formatting = {
	-- 	format = function(entry, vim_item)
	-- 		vim_item.kind = lspkind.presets.default[vim_item.kind]
	-- 		local menu = source_mapping[entry.source.name]
	-- 		if entry.source.name == "cmp_tabnine" then
	-- 			if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
	-- 				menu = entry.completion_item.data.detail .. " " .. menu
	-- 			end
	-- 			vim_item.kind = ""
	-- 		end
	-- 		vim_item.menu = menu
	-- 		return vim_item
	-- 	end,
	-- },
})

lsp.on_attach(function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			-- group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set

	bind("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	bind("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	bind("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	bind("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end)
	bind("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	bind("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	bind("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	bind("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	bind("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	bind("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	bind({ "i", "s" }, "<Tab>", function()
		luasnip.jump(1)
	end, { silent = true })
	bind({ "i", "s" }, "<S-Tab>", function()
		luasnip.jump(-1)
	end, { silent = true })
	-- bind("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

-- lsp.configure('gopls', {
--     settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- })

-- lsp.configure('rust-analyzer', {
--      settings = {
--         rust = {
--             unstable_features = true,
--             build_on_save = false,
--             all_features = true,
--         },
--     }
-- })

-- lsp.setup({capabilities = capabilities})
lsp.setup()

-- this is for inline diagnostics
vim.diagnostic.config({
	virtual_text = true,
})

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.eslint_d.with({
			-- args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "%filepath" },
		}),
		null_ls.builtins.completion.spell,
	},
})
