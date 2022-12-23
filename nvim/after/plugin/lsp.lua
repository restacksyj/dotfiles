local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
-- local lspconfig = require("lspconfig")
lsp.preset("recommended")

local cmp = require("cmp")
-- this does start adding what is recommended after the cursor
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

lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		-- add behavior: cmp_select if you have to disable the next automatically selected
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	}),
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
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp.on_attach(function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
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
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
				}) -- and so on
			end,
		}),
		null_ls.builtins.formatting.eslint_d.with({
			-- args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "%filepath" },
		}),
		null_ls.builtins.completion.spell,
	},
})
