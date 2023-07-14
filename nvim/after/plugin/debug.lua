local dap = require("dap")
require("dap-go").setup()

vim.api.nvim_set_keymap(
	"n",
	"<Leader>db",
	"<CMD>lua require('dap').toggle_breakpoint()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dui", "<cmd>lua require('dapui').toggle()<CR>", { noremap = true, silent = true })

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

-- Chrome
dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 9229,
	executable = {
		command = "node",
		args = { "~/.config/local/js-debug/src/dapDebugServer.js" },
	},
}

dap.configurations.javascript = {
	-- {
	-- 	name = "Launch",
	-- 	type = "node2",
	-- 	request = "launch",
	-- 	program = "${file}",
	-- 	cwd = vim.loop.cwd(),
	-- 	sourceMaps = true,
	-- 	protocol = "inspector",
	-- 	console = "integratedTerminal",
	-- },
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		-- cwd = "${workspaceFolder}",
		cwd = vim.fn.getcwd(),
	},
	{
		type = "node2",
		name = "Launch",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process
		-- is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

-- dap.configurations.go = {
-- 	{
-- 		type = "go",
-- 		name = "Debug",
-- 		request = "launch",
-- 		program = "${file}",
-- 	},
-- 	{
-- 		type = "go",
-- 		name = "Debug test", -- configuration for debugging test files
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "${file}",
-- 	},
-- 	-- works with go.mod packages and sub packages
-- 	{
-- 		type = "go",
-- 		name = "Debug test (go.mod)",
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "./${relativeFileDirname}",
-- 	},
-- }
